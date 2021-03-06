#!/usr/bin/env bash
set -euo pipefail

[ "${INPUT_NIX_PATH}" = "" ] && INPUT_NIX_PATH="nixpkgs=channel:nixos-unstable"

echo "NIX_PATH=${INPUT_NIX_PATH}" >>"$GITHUB_ENV"

if type -p nix >/dev/null 2>&1; then
	echo "Aborting: Nix is already installed at $(type -p nix)"
	exit
fi

# Append extra nix configuration if provided
[ "${INPUT_EXTRA_NIX_CONFIG}" != "" ] && add_config "$INPUT_EXTRA_NIX_CONFIG"

# Nix installer flags
installer_options=(
	--daemon
	--daemon-user-count 4
	--no-channel-add
	--darwin-use-unencrypted-nix-store-volume
	--nix-extra-conf-file /tmp/nix.conf
)
if [[ "${INPUT_INSTALL_OPTIONS}" != "" ]]; then
	IFS=' ' read -r -a extra_installer_options <<<"${INPUT_INSTALL_OPTIONS}"
	installer_options=("${extra_installer_options[@]}" "${installer_options[@]}")
fi

echo "installer options: " "${installer_options[@]}"
# On self-hosted runners we don't need to install more than once
if [[ ! -d /nix/store ]]; then
	sh <(curl --retry 5 --retry-connrefused -L "${INPUT_INSTALL_URL:-https://nixos.org/nix/install}") "${installer_options[@]}"
fi

if [[ $OSTYPE =~ darwin ]]; then
	# Disable spotlight indexing of /nix to speed up performance
	sudo mdutil -i off /nix

	# macOS needs certificates hints
	cert_file=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt
	echo "NIX_SSL_CERT_FILE=$cert_file" >>"$GITHUB_ENV"
	export NIX_SSL_CERT_FILE=$cert_file
	sudo launchctl setenv NIX_SSL_CERT_FILE "$cert_file"
fi

# Set paths
echo "/nix/var/nix/profiles/per-user/$USER/profile/bin" >>"$GITHUB_PATH"
echo "/nix/var/nix/profiles/default/bin" >>"$GITHUB_PATH"
