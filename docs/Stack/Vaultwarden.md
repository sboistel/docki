```yaml
version: '3'

services:
  vaultwarden:
    container_name: vaultwarden
    image: vaultwarden/server:latest
    restart: unless-stopped
    volumes:
      - ./data/:/data/
    ports:
      - 3012:3012
      - 8080:80
    environment:
      - DOMAIN=https://vault.sboistel.fr
      - LOGIN_RATELIMIT_MAX_BURST=10
      - LOGIN_RATELIMIT_SECONDS=60
      - ADMIN_RATELIMIT_MAX_BURST=10
      - ADMIN_RATELIMIT_SECONDS=60
      - ADMIN_TOKEN=$ADMIN_TOKEN
      - SENDS_ALLOWED=true
      - EMERGENCY_ACCESS_ALLOWED=true
      - WEB_VAULT_ENABLED=true
      - SIGNUPS_ALLOWED=false
      - SIGNUPS_VERIFY=true
      - SIGNUPS_VERIFY_RESEND_TIME=3600
      - SIGNUPS_VERIFY_RESEND_LIMIT=5
      - SIGNUPS_DOMAINS_WHITELIST=sboistel.fr,gmail.com
      - SMTP_HOST=smtp.gmail.com
      - SMTP_FROM=vaultwarden@sboistel.fr
      - SMTP_FROM_NAME=Vaultwarden
      - SMTP_SECURITY=starttls
      - SMTP_PORT=587
      - SMTP_USERNAME=$MAIL_ACCOUNT
      - SMTP_PASSWORD=$MAIL_PASSWORD
      #- SMTP_AUTH_MECHANISM="Mechanism"
	  ```