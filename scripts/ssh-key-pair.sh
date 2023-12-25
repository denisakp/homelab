#!/bin/bash

set -eo pipefail
set -x

ENV_FILE=".env"
OUTPUT_PATH="data/ssh-key-pair"

cd ..

if [ ! -f "$ENV_FILE" ]; then
  cp .env.example "$ENV_FILE"

  mkdir -p "$OUTPUT_PATH"
  cd "$OUTPUT_PATH"

  ssh-keygen -t rsa -N '' -f "$(pwd)/id_rsa"
  SSH_PUBLIC_KEY=$(cat "$(pwd)/id_rsa.pub")

  cd ../../
  awk '!/^JENKINS_AGENT_SSH_PUBKEY=/' "$ENV_FILE" > temp && mv temp "$ENV_FILE"

  echo 'JENKINS_AGENT_SSH_PUBKEY="'"$SSH_PUBLIC_KEY"'"' >> "$ENV_FILE"
fi
