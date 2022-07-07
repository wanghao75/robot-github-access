FROM golang:1.16.3 as BUILDER

MAINTAINER zengchen1024<chenzeng765@gmail.com>

# build binary
WORKDIR /go/src/github.com/opensourceways/robot-github-access
COPY . .
RUN GO111MODULE=on CGO_ENABLED=0 go build -a -o robot-github-access .

# copy binary config and utils
FROM alpine:3.14
COPY  --from=BUILDER /go/src/github.com/opensourceways/robot-github-access/robot-github-access /opt/app/robot-github-access

ENTRYPOINT ["/opt/app/robot-github-access"]
