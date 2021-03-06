FROM golang:alpine as builder

WORKDIR /go/src/BaiduPCS-Go
COPY . .
RUN go build

FROM alpine
COPY --from=builder /go/src/BaiduPCS-Go/BaiduPCS-Go /
WORKDIR /
ENTRYPOINT ["/BaiduPCS-Go"]
EXPOSE 9181
