# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o echo

# final stage
FROM alpine
WORKDIR /app
ARG PORT=5000
ENV PORT ${PORT}
COPY --from=build-env /src/echo /app/
ENTRYPOINT ./echo
