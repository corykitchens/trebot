FROM golang:1.11.4-stretch as build

#Copy source
#and install deps
WORKDIR /go/src/bezobot
COPY . .
RUN go get -d -v ./...
#Workaround
WORKDIR /go/src/github.com/nlopes/slack
RUN  git checkout v0.4.0

FROM golang:1.11.4-stretch as app
COPY --from=build /go/src /go/src
WORKDIR /go/src/bezobot
RUN go build main.go


ENTRYPOINT [ "./main" ]
