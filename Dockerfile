FROM golang:1.17-alpine3.16 as builder

WORKDIR /src

COPY go.mod .
RUN go mod download

COPY main.go .
RUN go build -o /out/main .

FROM alpine:3.16
COPY --from=builder /out/main /usr/local/bin/main
ENTRYPOINT ["main"]
