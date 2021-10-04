FROM golang:latest AS builder

WORKDIR /app

COPY ./src/ /app

RUN go build -ldflags="-s -w" /app/main.go

FROM scratch
COPY --from=builder /app/main /app/main
CMD ["/app/main"]