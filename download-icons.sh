#!/bin/bash
# 어신 기능 아이콘 6종 다운로드 (투명 PNG 유지) — URL 약 7일 유효
set -e
cd "$(dirname "$0")/assets/img"
declare -a MAP=(
  "icon-index 5b926a86-f960-452a-afe7-122fd3e94e79"
  "icon-bite 238f6bf0-f145-4627-a5ad-05aa6b02a66e"
  "icon-activity 91caf8ec-9c83-4b74-8958-b833f717ede4"
  "icon-tide 071059b3-eed1-4a56-a87f-e4800be7da8f"
  "icon-forecast 545abe58-b979-4694-9319-b7bd0cbbd973"
  "icon-community aafccdc1-5c37-4deb-8fce-34bcd25a996e"
)
for entry in "${MAP[@]}"; do
  name="${entry%% *}"; id="${entry##* }"
  echo "↓ ${name}.png"
  curl -sL -o "${name}.png" "https://www.figma.com/api/mcp/asset/${id}"
done
echo "✓ 아이콘 6종 완료 → assets/img/"
