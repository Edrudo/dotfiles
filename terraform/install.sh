#!/bin/bash
#
# Terraform
#
# Installs Terraform versions using tfenv. Assumes 'tfenv' already exists in $PATH - see homebrew topic.
#

info "Starting terraform install..."

# List Terraform versions to install, do NOT add a comma between versions.
# The LAST version listed will be set as the default version.
versions=( "1.8.5" "1.10.5" "1.14.2" "1.12.2" )

for version in "${versions[@]}"
do
  if tfenv list | grep -q "$version"
  then
    info "Terraform $version already installed"
  else
    info "Installing terraform $version..."
    tfenv install "$version"
  fi
done

VERSION=${versions[${#versions[@]}-1]}
info "Setting default terraform version to $VERSION..."
tfenv use "$VERSION"

success "Terraform installation complete"
