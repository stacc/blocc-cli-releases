#!/bin/bash

echo " _     _                "
echo "| |__ | | ___   ___ ___ "
echo "| '_ \| |/ _ \ / __/ __|"
echo "| |_) | | (_) | (_| (__ "
echo "|_.__/|_|\___/ \___\___|"
echo ""

if [[ ! ":$PATH:" == *":/usr/local/bin:"* ]]; then
    echo "Your path is missing /usr/local/bin, you need to add this to use this installer."
    exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
    OS=darwin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    OS=linux
else
    echo "This installer is only supported on Linux and MacOS"
    exit 1
fi

ARCH="\$(uname -m)"

VERSION=$(curl -L --silent "https://api.github.com/repos/stacc/blocc-cli-releases/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

URL="https://github.com/stacc/blocc-cli-releases/releases/download/$VERSION/blocc_${VERSION:1}_$(uname)_$(uname -m).tar.gz"

echo "- Downloading from $URL"

if [ $(command -v curl) ]; then
    curl -LSs "$URL" | tar xz
else
    wget -O- "$URL" | tar xz
fi

if [ $? -ne 0 ]; then
    echo "Failed to download from $URL"
    exit 1
fi

TARGET="/usr/local/bin/blocc"

echo "- Installing binary to $TARGET"

sudo mv "blocc" "$TARGET"

LOCATION=$(command -v blocc)
echo ""
echo "blocc CLI has been successfully installed!"
