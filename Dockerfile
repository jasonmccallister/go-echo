# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o echo

# final stage
FROM alpine
WORKDIR /app
ARG LISTEN_PORT=5000
ENV LISTEN_PORT ${LISTEN_PORT}
COPY --from=build-env /src/echo /app/
ENTRYPOINT ./echo
