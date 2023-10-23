FROM golang:1.16-alpine AS builder
WORKDIR /backend
RUN apk add --no-cache gcc build-base
COPY . .
RUN go build -o main .

FROM alpine:3.14
WORKDIR /app
COPY --from=builder /backend/main .
EXPOSE 9000
CMD ["./main"]