#!/bin/bash

set -euo pipefail
ARGS=(
    "--http-host=0.0.0.0"
    "--no-wallet"
    "--listen=true"
    "--bip37=true"
    "--max-inbound=100"
)
EXTERNAL_IP=$(curl -q http://ip1.dynupdate.no-ip.com);
ARGS+=("--public-host=${EXTERNAL_IP}")

exec hsd ${ARGS[*]}
