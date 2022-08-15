#!/usr/bin/env bash
set -u

echo "🔎 Checking user..."
user="$(whoami)"
echo "🤖 User '${user}' was found!"

echo "🔎 Checking if trusted users exist..."
grep trusted-users /etc/nix/nix.conf

if [ "$?" = '1' ]; then
	echo "😅 Does not exist"
	echo "➕ Adding root and current user..."
	echo "trusted-users = root ${user}" | sudo tee -a /etc/nix/nix.conf && sudo pkill nix-daemon
	echo "✅ Sucessfully added roo and current user as trusted user!"
else
	echo "✅ Trust user field exist"
	echo "🔎 Checking if current user is trusted..."
	grep trusted-users /etc/nix/nix.conf | grep "${user}"
	if [ "$?" = '1' ]; then
		echo "🔐 Trusting current user..."
		line=$(grep trusted-users /etc/nix/nix.conf)
		sudo "$(which sed)" -i "s/${line}/${line} ${user}/g" /etc/nix/nix.conf
		sudo pkill nix-daemon
	fi
	echo "✅ Current user is trusted!"
fi
