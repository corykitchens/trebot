FROM golang:1.11.4-stretch as build

#Copy source
#and install deps
WORKDIR /go/src/trebot
COPY . .
RUN go get -d -v ./...

FROM golang:1.11.4-stretch as app
COPY --from=build /go/src /go/src
WORKDIR /go/src/trebot
RUN go build main.go


ENTRYPOINT [ "./main" ]
