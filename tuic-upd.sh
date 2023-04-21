#!/bin/bash

# 检查系统架构
ARCH=$(uname -m)

# 根据架构执行命令
if [[ "$ARCH" == "x86_64" || "$ARCH" == "amd64" ]]; then
  echo "Detected AMD64 architecture. Download tuic now."
  sudo curl -Lo /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-server-0.8.5-x86_64-linux-musl
  sudo chmod +x /usr/local/bin/tuic
  
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
  echo "Detected ARM64 architecture. Download tuic now."
  sudo curl -Lo /usr/local/bin/tuic https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-server-0.8.5-aarch64-linux-musl
  sudo chmod +x /usr/local/bin/tuic

else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi