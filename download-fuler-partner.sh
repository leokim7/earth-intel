#!/bin/bash
# Fuler 4장 + 어신 파트너스 5장 스크린샷 다운로드 (Mac에서 실행) — URL 약 7일 유효
set -e
cd "$(dirname "$0")/assets/img"
declare -a MAP=(
  "fuler-1 93dcef90-8052-4d64-9dfb-5ea51bf422a0"
  "fuler-2 ec54f2ce-2ee8-49bf-84ae-dccb266be1b0"
  "fuler-3 5453dc3e-50db-4777-a968-c8899fb8cb41"
  "fuler-4 e25fd0e0-decf-4362-bb05-5409294e59ea"
  "partner-1 682701da-712e-4a6c-a1bd-1b5356744522"
  "partner-2 43bad939-6fa2-4c19-8463-f6f1f7647014"
  "partner-3 f0199af0-4803-4adc-af6b-52d09db0cdbd"
  "partner-4 0b10989e-cde4-4c70-9048-5430081a537e"
  "partner-5 35188cc7-0ef6-4b44-8343-9043b8e3b5c8"
)
for entry in "${MAP[@]}"; do
  name="${entry%% *}"; id="${entry##* }"
  echo "↓ ${name}.jpg"
  curl -sL -o "${name}.png" "https://www.figma.com/api/mcp/asset/${id}"
  sips -s format jpeg -s formatOptions 85 "${name}.png" --out "${name}.jpg" >/dev/null
  rm -f "${name}.png"
done
echo "✓ 9장 완료 → assets/img/"
