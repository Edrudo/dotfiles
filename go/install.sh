#!/bin/bash
#
# Go
#
# Installs Go developer tools. Assumes 'go' already exists in $PATH - see homebrew topic.
#

info "Starting go tools install..."

tools=(
  "gopls|golang.org/x/tools/gopls@latest"
  "dlv|github.com/go-delve/delve/cmd/dlv@latest"
  "goimports|golang.org/x/tools/cmd/goimports@latest"
  "staticcheck|honnef.co/go/tools/cmd/staticcheck@latest"
  "mockery|github.com/vektra/mockery/v2@latest"
)

gobin="$(go env GOPATH)/bin"

for tool in "${tools[@]}"
do
  name="${tool%%|*}"
  package="${tool#*|}"

  if test -x "$gobin/$name"
  then
    info "$name already installed"
  else
    info "Installing $name..."
    go install "$package"
  fi
done

success "Go tools installation complete"
