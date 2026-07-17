#!/bin/bash
# SGMA homepage v2 — Figma 이미지 다운로드 (Mac에서 실행)
# 사용법: cd sgma-homepage && bash download-images.sh
# URL은 발급 후 약 7일간 유효합니다. 만료 시 Claude에게 재발급 요청하세요.
set -e
cd "$(dirname "$0")/assets/img"

declare -a MAP=(
  "hero-home f6f9ac1f-7f39-4467-a834-3d1acb12b126"
  "hero-about 65e7c91d-f3c8-4f83-9d31-62ad6aa7980f"
  "hero-yeosin 0511b0c0-014b-48e5-9b5d-79bdd2fdc54c"
  "hero-partners 4d2a732a-9ec5-4c28-acd7-9942f0c1f87d"
  "hero-fuler 83c54020-db2a-4d77-820c-d079abe4bdaf"
  "hero-bluematrix 2c7a2ace-3873-4550-9c9a-a1532b3c0ac2"
  "hero-technology afc1cbd8-be64-4f42-b417-fda1b0605bf9"
  "hero-contact b132b533-79ea-44d1-bf7e-ee793293ad6b"
  "card-yeosin 733cd055-0272-4a21-8de1-c11542a60d8b"
  "card-partners 38f579c8-6736-4db0-9386-46c9f8d71157"
  "card-fuler 67789270-2133-4f0f-8760-45a8c27547d9"
  "card-bluematrix 1e258455-83e8-40ca-9834-a9a849f2ff44"
  "uc-ocean eb14be29-7bd0-4fc6-8899-59db4351534e"
  "uc-disaster d8712bb5-600c-4b3e-b08c-b787ee60e189"
  "uc-agri fbfd0da3-73fd-478e-b0e4-c150f35ee860"
  "uc-logistics 5f3af0a8-da82-437e-a034-e5f98a4684fd"
  "uc-finance c2db9523-e51e-40bc-b835-91e8fe076991"
)

for entry in "${MAP[@]}"; do
  name="${entry%% *}"; id="${entry##* }"
  echo "↓ ${name}.jpg"
  curl -sL -o "${name}.png" "https://www.figma.com/api/mcp/asset/${id}"
  sips -s format jpeg -s formatOptions 82 "${name}.png" --out "${name}.jpg" >/dev/null
  rm -f "${name}.png"
done
echo "✓ 17개 이미지 다운로드 완료 → assets/img/"
