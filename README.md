# Go Echo

This is a simple Go program that will take an HTTP POST request and return the data as JSON, thats it.

This is useful for local development with tools like [Hasura](https://hasura.io/all-features#triggerWebhooks) that use events to trigger webhooks. When developing locally, you can use this Go application (or the associated Docker image) to listen to HTTP responses and echo them.

## Using Go

To use this with Go, install and run like a normal Go program.

## Using Docker

This is the prefered method and should be used with Docker Compose and your project. Here is an example using Docker Compose with Hasura:

```
version: "3.6"
services:
  echo:
    image: jasonmccallister/go-echo
    ports:
    - 5000:5000
    environment:
      LISTEN_PORT: 5000
  postgres:
    image: postgres:11-alpine
    ports:
      - 5432:5432
    volumes:
      - db_data:/var/lib/postgresql/data
  graphql-engine:
    image: hasura/graphql-engine:v1.0.0-beta.2
    ports:
      - 8080:8080
    depends_on:
      - "postgres"
    environment:
      HASURA_GRAPHQL_DATABASE_URL: postgres://postgres:@postgres:5432/postgres
      HASURA_GRAPHQL_ENABLE_CONSOLE: "true"
      HASURA_GRAPHQL_ADMIN_SECRET: somesupersecretpassword
volumes:
  db_data:
```
