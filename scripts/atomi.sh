#! /bin/sh

install() {
	name="$1"
	binary="$2"
	checker="$3"

	(echo "🔍 checking for \"${name}\"..." &&
		${name} "${checker}" >/dev/null 2>&1 &&
		echo "✔ \"${name}\" found! ") ||
		(echo "❌ \"${name}\" not found!" &&
			echo "🚀 Installing \"${name}\"..." &&
			nix-env -i "${binary}" >/dev/null 2>&1 &&
			echo "✔ \"${name}\" installed")

}

# install git
install git git --version

# install bash
install bash bash --version

# install tar
install tar gnutar --version

# install cachix
install cachix cachix --version
