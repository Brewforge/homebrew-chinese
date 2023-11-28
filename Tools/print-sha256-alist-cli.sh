#!/bin/bash

VERSION="3.29.1"
DOWNLOAD_URL="https://github.com/alist-org/alist/releases/download"

echo "  if OS.mac?"
echo "    sha256 Hardware::CPU.arm? ?"

sha256=$(curl -sL ${DOWNLOAD_URL}/v${VERSION}/alist-darwin-arm64.tar.gz | shasum -a 256 | cut -d " " -f 1)
echo "            \"${sha256}\" :"

sha256=$(curl -sL ${DOWNLOAD_URL}/v${VERSION}/alist-darwin-amd64.tar.gz | shasum -a 256 | cut -d " " -f 1)
echo "            \"${sha256}\""

echo "  else"
echo "    sha256 Hardware::CPU.arm? ?"

sha256=$(curl -sL ${DOWNLOAD_URL}/v${VERSION}/alist-linux-arm64.tar.gz | shasum -a 256 | cut -d " " -f 1)
echo "            \"${sha256}\" :"

sha256=$(curl -sL ${DOWNLOAD_URL}/v${VERSION}/alist-linux-amd64.tar.gz | shasum -a 256 | cut -d " " -f 1)
echo "            \"${sha256}\""

echo "  end"
