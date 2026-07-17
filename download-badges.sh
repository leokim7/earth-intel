#!/bin/bash
# 스토어 배지 2종 (@3x PNG) — URL 약 7일 유효
set -e
cd "$(dirname "$0")/assets/img"
curl -sL -o badge-googleplay.png "https://www.figma.com/api/mcp/asset/57e415d0-ddc8-4bac-bd4e-b96a2f4f1713"
curl -sL -o badge-appstore.png "https://www.figma.com/api/mcp/asset/c49ce74c-8303-49d1-a20d-518e7f9c2901"
echo "✓ 배지 2종 완료 → assets/img/"
