#!/usr/bin/env bash
# Membungkus benuanta-city.html dengan kerangka HTML lengkap agar bisa dibuka di browser biasa.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
{
  printf '<!doctype html>\n<html lang="id">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n</head>\n<body>\n'
  cat benuanta-city.html
  printf '\n</body>\n</html>\n'
} > dist/index.html
echo "dist/index.html siap"
