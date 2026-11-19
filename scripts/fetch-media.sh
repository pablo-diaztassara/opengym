#!/usr/bin/env bash
# Manually download the exercise images (JPG) and animations (GIF) into ./media.
# You normally DON'T need this — `docker compose up` fetches them automatically.
# Source: hasaneyldrm/exercises-dataset (CC).
set -euo pipefail
cd "$(dirname "$0")/.."
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
git clone --no-checkout --filter=blob:none https://github.com/hasaneyldrm/exercises-dataset "$tmp"
git -C "$tmp" checkout 7455efae41b330c265e7cd4b78dfa848e7ce5ebd
mkdir -p media/img media/gif
cp "$tmp"/images/*.jpg media/img/
cp "$tmp"/videos/*.gif media/gif/
echo "✓ $(ls media/img | wc -l) images, $(ls media/gif | wc -l) GIFs"
