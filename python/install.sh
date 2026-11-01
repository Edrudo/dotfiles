#!/bin/bash
#
# Python
#
# Installs Miniconda to ~/miniconda3. The conda shell hook is loaded by bashrc.symlink, so
# 'conda init' is deliberately not run (it edits the rc files).
#

info "Starting python install..."

if test -x "$HOME/miniconda3/bin/conda"
then
  info "Miniconda already installed"
else
  case "$(uname -s)-$(uname -m)" in
    Darwin-arm64)  installer="MacOSX-arm64" ;;
    Darwin-x86_64) installer="MacOSX-x86_64" ;;
    Linux-aarch64) installer="Linux-aarch64" ;;
    Linux-x86_64)  installer="Linux-x86_64" ;;
    *) fail "Unsupported platform for Miniconda: $(uname -s)-$(uname -m)" ;;
  esac

  info "Installing miniconda..."
  tmp_installer="$(mktemp)"
  curl -fsSL "https://repo.anaconda.com/miniconda/Miniconda3-latest-$installer.sh" -o "$tmp_installer"
  bash "$tmp_installer" -b -p "$HOME/miniconda3"
  rm -f "$tmp_installer"
fi

success "Python installation complete"
