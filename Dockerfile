FROM golang:latest

RUN apt-get update && apt-get upgrade -y

# install goa
RUN go install goa.design/goa/v3/cmd/goa@v3
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# clean apt cache
RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/