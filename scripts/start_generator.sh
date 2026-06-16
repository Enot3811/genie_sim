#!/usr/bin/env bash

# current folder as WORD_DIR
CURRENT_DIR=$(pwd)

set -euo pipefail

# Fail fast: we must be in the repo root
if [[ ! -d .git ]]; then
    cat <<EOF
ERROR: $(basename "$0") must be run from the repository root.

Current directory: $(pwd)

Please run:
    ./scripts/$(basename "$0")   [options]
EOF
    exit 1
fi

if [ -f "$CURRENT_DIR/.env" ]; then
    # shellcheck disable=SC1091
    set -a
    source "$CURRENT_DIR/.env"
    set +a
fi

if [[ -z "${SIM_ASSETS:-}" ]]; then
    cat <<EOF
ERROR: SIM_ASSETS is not set. Please define it in the .env file.

Example:
    SIM_ASSETS="/path/to/GenieSimAssets"
EOF
    exit 1
fi

if [[ ! -d "$SIM_ASSETS" ]]; then
    echo "ERROR: SIM_ASSETS directory does not exist: $SIM_ASSETS"
    exit 1
fi

echo "using SIM_ASSETS='$SIM_ASSETS'"

echo $UID
# echo $GID
# export UID=$(id -u)
export GID=$(id -g)

# Parse arguments
USE_TEXT_EMBEDDING=true
DOCKER_COMPOSE_ARGS=()

for arg in "$@"; do
    case $arg in
        --vl_embedding)
            USE_TEXT_EMBEDDING=false
            ;;
        -h|--help)
            echo "Usage: $0 [--text_embedding] [docker compose arguments...]"
            echo ""
            echo "Options:"
            echo "  --text_embedding    Use text embedding profile (default: vl profile)"
            echo "  -h, --help          Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0                          # Start with vl profile"
            echo "  $0 --text_embedding         # Start with text profile"
            echo "  $0 --text_embedding -d      # Start with text profile in background"
            exit 0
            ;;
        *)
            # Pass other arguments to docker compose
            DOCKER_COMPOSE_ARGS+=("$arg")
            ;;
    esac
done

# Select profile based on arguments
if [ "$USE_TEXT_EMBEDDING" = true ]; then
    PROFILE="text"
    echo "Using text embedding profile"
else
    PROFILE="vl"
    echo "Using vl profile"
fi

# If we get here we are in the repo root – continue safely
docker compose -f source/geniesim/generator/compose.yaml --profile "$PROFILE" up --build "${DOCKER_COMPOSE_ARGS[@]}"
