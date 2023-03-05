#!/bin/sh

go install mvdan.cc/gofumpt@latest
go install github.com/incu6us/goimports-reviser/v3@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/segmentio/golines@latest
go install github.com/client9/misspell/cmd/misspell@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
go install github.com/google/yamlfmt/cmd/yamlfmt@latest
