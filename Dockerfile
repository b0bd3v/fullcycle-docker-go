FROM golang:1.20 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -buildvcs=false

FROM scratch
COPY --from=builder /usr/src/app/rocks .
CMD ["./rocks"]
