```yaml
version: "3"
services:

  db:
    image: postgres:11-alpine
    environment:
      POSTGRES_DB: wiki
      POSTGRES_PASSWORD: wikijoepassword
      POSTGRES_USER: wikijs
    logging:
      driver: "none"
    restart: unless-stopped
    volumes:
      - db-data:/var/lib/postgresql/data

  wikijs:
    image: ghcr.io/requarks/wiki:latest
    depends_on:
      - db
    environment:
      DB_TYPE: postgres
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: wikijoepassword
      DB_NAME: wiki
    restart: unless-stopped
    ports:
      - "8080:3000"

volumes:
  db-data:
  ```