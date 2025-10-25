FROM golang:1.23-alpine AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-w -s" -o /usr/bin/railpack cmd/cli/main.go

FROM alpine

LABEL moby.buildkit.frontend.caps="moby.buildkit.frontend.inputs,moby.buildkit.frontend.contexts,moby.buildkit.frontend.subrequests"

COPY --from=builder /usr/bin/railpack /usr/bin/railpack
ENTRYPOINT ["/usr/bin/railpack", "frontend"]
