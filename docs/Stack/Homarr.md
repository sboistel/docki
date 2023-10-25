```yaml
version: '3'
#---------------------------------------------------------------------#
#     Homarr - A simple, yet powerful dashboard for your server.     #
#---------------------------------------------------------------------#
services:
  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    restart: unless-stopped
    volumes:
      - /data/:/app/data/configs
      - /data/:/app/public/icons
    ports:
      - '7575:7575'
```