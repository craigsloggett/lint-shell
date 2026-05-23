#!/bin/sh

set -eu

os="$(uname -s | tr '[:upper:]' '[:lower:]')"
arch="$(uname -m)"

case "${arch}" in
  x86_64 | amd64) arch="x86_64" ;;
  aarch64 | arm64) arch="aarch64" ;;
  *)
    echo "Unsupported architecture: ${arch}"
    exit 1
    ;;
esac

github_releases_url="https://github.com/koalaman/shellcheck/releases/download"
download_url="${github_releases_url}/v${SHELLCHECK_VERSION}/shellcheck-v${SHELLCHECK_VERSION}.${os}.${arch}.tar.xz"

echo "Installing shellcheck v${SHELLCHECK_VERSION}"
temp_dir=$(mktemp -d)
curl -sSL "${download_url}" | tar -xJ -C "${temp_dir}" "shellcheck-v${SHELLCHECK_VERSION}/shellcheck"
install -m 0755 "${temp_dir}/shellcheck-v${SHELLCHECK_VERSION}/shellcheck" /usr/local/bin/shellcheck
shellcheck --version
