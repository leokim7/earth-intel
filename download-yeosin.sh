#!/bin/bash
# 어신 앱 스크린샷 5장 다운로드 (Mac에서 실행) — URL 약 7일 유효
set -e
cd "$(dirname "$0")/assets/img"
declare -a MAP=(
  "yeosin-1 f690a85e-05ae-4563-8b36-40db355f3b82"
  "yeosin-2 7dd7a120-88cb-4207-ad67-af92d31265bf"
  "yeosin-3 60f67640-57b1-4ee2-a76c-f5cc89a07c79"
  "yeosin-4 6ed6914a-2f2f-4da9-832a-c7412681ea83"
  "yeosin-5 3d09526a-93d7-4470-b3d3-764156c712e4"
)
for entry in "${MAP[@]}"; do
  name="${entry%% *}"; id="${entry##* }"
  echo "↓ ${name}.jpg"
  curl -sL -o "${name}.png" "https://www.figma.com/api/mcp/asset/${id}"
  sips -s format jpeg -s formatOptions 85 "${name}.png" --out "${name}.jpg" >/dev/null
  rm -f "${name}.png"
done
echo "✓ 어신 스크린샷 5장 완료 → assets/img/"
