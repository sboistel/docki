---
title: Authelia
description: Authelia is an open-source authentication and authorization server providing 2-factor authentication and single sign-on (SSO) for your applications via a web portal.
---

## Docker Compose

```yml
---
services:
  authelia:
    container_name: authelia
    image: authelia/authelia
    restart: unless-stopped
    env_file: .env
    networks:
      - external
        #    ports:
        #      - '9092:9091' # Authelia web interface
    volumes:
      - './data/config:/config'

networks:
  external:
    external: true
    name: external
```

### Configuration

Template

```conf
location /authelia {
    internal;
    set $upstream_authelia http://authelia:9091/api/verify;
    proxy_pass_request_body off;
    proxy_pass $upstream_authelia;    
    proxy_set_header Content-Length "";
 
    # Timeout if the real server is dead
    proxy_next_upstream error timeout invalid_header http_500 http_502 http_503;
    client_body_buffer_size 128k;
    proxy_set_header Host $host;
    proxy_set_header X-Original-URL $scheme://$http_host$request_uri;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $remote_addr; 
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Host $http_host;
    proxy_set_header X-Forwarded-Uri $request_uri;
    proxy_set_header X-Forwarded-Ssl on;
    proxy_redirect  http://  $scheme://;
    proxy_http_version 1.1;
    proxy_set_header Connection "";
    proxy_cache_bypass $cookie_session;
    proxy_no_cache $cookie_session;
    proxy_buffers 4 32k;
 
    send_timeout 5m;
    proxy_read_timeout 240;
    proxy_send_timeout 240;
    proxy_connect_timeout 240;
}
 
    location / {
        set $upstream_SUBDOMAIN_NAME http://TARGET:PORT;
        proxy_pass $upstream_SUBDOMAIN_NAME;

		auth_request /authelia;
		auth_request_set $target_url $scheme://$http_host$request_uri;
		auth_request_set $user $upstream_http_remote_user;
		auth_request_set $groups $upstream_http_remote_groups;
		proxy_set_header Remote-User $user;
		proxy_set_header Remote-Groups $groups;
		error_page 401 =302 https://auth.sboistel.fr/?rd=$target_url;
 
		client_body_buffer_size 128k;
 
		proxy_next_upstream error timeout invalid_header http_500 http_502 http_503;
 
		send_timeout 5m;
		proxy_read_timeout 360;
		proxy_send_timeout 360;
		proxy_connect_timeout 360;
 
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
		proxy_set_header X-Forwarded-Host $http_host;
		proxy_set_header X-Forwarded-Uri $request_uri;
		proxy_set_header X-Forwarded-Ssl on;
		proxy_redirect  http://  $scheme://;
		proxy_http_version 1.1;
		proxy_set_header Connection "";
		proxy_cache_bypass $cookie_session;
		proxy_no_cache $cookie_session;
		proxy_buffers 64 256k;
 
		set_real_ip_from 192.168.100.0/24;#IP VPN
		set_real_ip_from 192.168.10.254;#IP RESEAU LOCAL
		real_ip_header X-Forwarded-For;
		real_ip_recursive on;
 
    }
```

## Scripts

### Secrets

Generate encrypted secrets :

```bash
#!/usr/bin/env bash

secret_list=(
    "jwt_secret"
    "session_secret"
    "storage_password"
    "storage_encryption_key"
)

if [ -f ".env" ]; then
    echo ".env file already exists. Please remove it before running this script."
    echo "Backup of existing .env file created as .env.bak"
    mv .env .env.bak
fi

for secret_name in "${secret_list[@]}"; do
    secret_value=$(docker run --rm authelia/authelia:latest authelia crypto rand --length 64 --charset alphanumeric | awk '{print $3}')
    echo "$secret_name=\"$secret_value\"" >> .env
    if [ $? -ne 0 ]; then
        echo "Failed to generate ${secret_name}. Please check your Docker setup."
        return 1
    else
        echo "${secret_name} generated successfully."
    fi
done
```

### Proxy

Generate new proxy :

```bash
#!/usr/bin/env bash

# COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# VARIABLES
TEMPLATE_PATH="$(dirname "$0")/../data/config/proxy/template.txt"
OUTPUT_DIR="$(dirname "$0")/../data/config/proxy/"
TARGET="$1"
PORT="$2"
SUBDOMAIN="$3"

# FUNCTIONS
function help () {
    echo "Usage: $0 TARGET/CONTAINER_NAME PORT SUBDOMAIN_NAME"
    echo "Example: $0
    echo "  TARGET/CONTAINER_NAME: The IP address or Docker container name of the target service."
    echo "  PORT: The port number on which the target service is running."
    echo "  SUBDOMAIN_NAME: The subdomain name to be used in the proxy configuration
    echo "This script generates a proxy configuration file based on the provided parameters."
}

function process () {
    sed \
        -e "s|http://TARGET:PORT|http://$TARGET:$PORT|g" \
        -e "s|SUBDOMAIN_NAME|${SUBDOMAIN%.conf}|g" \
        "$TEMPLATE_PATH" | tee "$OUTPUT_DIR/$SUBDOMAIN".txt

    echo -e "\nProxy config created at $OUTPUT_DIR/$SUBDOMAIN.txt"
}

# RUN

if [ -z "$TARGET" ]; then
    echo -e "${YELLOW}No parameters provided. Entering interactive mode...${NC}"
    echo -e "\nList of running containers and their ports:"
    docker ps --format '+ {{.Names}}'
    read -rp "Please enter the target IP address or Docker container name: " TARGET
fi

if [ -z "$PORT" ]; then
    echo -e "${YELLOW}Searching for running containers matching '$TARGET'...${NC}"
    docker ps --format "{{.Names}}: {{.Ports}}" | grep "$TARGET" | awk '/>/ {print}'
    read -rp "Enter the port number (e.g., 8080): " PORT
    if [ -z "$PORT" ]; then
        echo -e "${RED}Error: Could not find a running container with name or IP '$TARGET'.${NC}"
        exit 1
    fi
fi

if [ -z "$SUBDOMAIN" ]; then
    read -rp "Enter the sub.domain name (e.g., tartampion for tartampion.yourdomain.com): " SUBDOMAIN
    SUBDOMAIN="${SUBDOMAIN}"
fi

if [ -n "$TARGET" ] && [ -n "$PORT" ] && [ -n "$SUBDOMAIN" ]; then
    process
else
    echo -e "${RED}Error: Missing parameters. Please provide (TARGET/CONTAINER_NAME), PORT, and SUBDOMAIN_NAME.${NC}"
    exit 1
fi
```

### Users

Create new user :

```bash
#!/usr/bin/env bash

# Vars
read -rp "Enter the full name of the user (John Doe): " fullname
read -rp "Enter the username: " username
read -rp "Enter the password: " password
read -rp "Enter the email: " email
read -rp "Enter the groups (comma-separated | default:[]): " groups

# Checks
if [[ -z "$username" ]]; then
  echo "Username cannot be empty."
  return 1
fi
if [[ -z "$fullname" ]]; then
  echo "Full name cannot be empty."
  return 1
fi
if [[ -z "$password" ]]; then
  echo "Password cannot be empty."
  return 1
fi
if [[ -z "$email" ]]; then
  echo "Email cannot be empty."
  return 1
fi

# RUN
echo "Generate argon2 password for user $username..."
argon_password=$(docker run --rm authelia/authelia:latest authelia crypto hash generate argon2 --password "$password" | awk '{print $2}')

echo "Creating user $fullname with email $email and groups $groups..."
echo -e "# User $username\n# Password: $password\n---" > ../config/.cred_archives/${username}.yml
echo -e "  $username:\n    disabled: false\n    displayname: '$fullname'\n    password: '$argon_password'\n    email: '$email'\n    groups: [$groups]" | tee -a "../config/users_database.yml" ../config/.cred_archives/${username}.yml

# EOF
```
