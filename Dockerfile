FROM golang:1.23 AS builder
WORKDIR /go/src/github.com/open-cluster-management.io/managed-serviceaccount
COPY . .
RUN make build-bin

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
COPY --from=builder /go/src/github.com/open-cluster-management.io/managed-serviceaccount/bin/msa /
