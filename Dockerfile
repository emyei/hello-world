# syntax=docker/dockerfile:1

FROM golang:1.8 AS base
WORKDIR /go/src/github.com/codeship/go-hello-world
COPY hello-world.go .
RUN go build -o hello-world .

CMD ./hello-world


FROM alpine:latest

WORKDIR /app
COPY --from=base /go/src/github.com/codeship/go-hello-world/hello-world ./

ENTRYPOINT ["/app/hello-world"]  


