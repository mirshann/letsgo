FROM golang:1.22.1 as builder
WORKDIR /src
COPY main.go /src/main.go
RUN go build -o /bin/snippetbox main.go


FROM scratch
COPY --from=builder /bin/snippetbox /bin/snippetboxdocker
EXPOSE 80/tcp
CMD ["/bin/snippetbox"]