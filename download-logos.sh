#!/bin/bash
# 투자사·파트너사 로고 다운로드 (Mac에서 실행)
# 사용법: cd sgma-homepage && bash download-logos.sh
# Clearbit Logo API(도메인 기반)로 시도 — 실패한 항목은 사이트에서 텍스트로 자동 폴백됩니다.
# 더 좋은 화질이 필요하면 각사 CI 파일을 같은 파일명으로 assets/img/logos/ 에 넣으면 됩니다.
mkdir -p "$(dirname "$0")/assets/img/logos"
cd "$(dirname "$0")/assets/img/logos"

try() { # name domain
  echo "↓ $1 ($2)"
  curl -sL -f -o "$1.png" "https://logo.clearbit.com/$2?size=256" \
    && echo "  ✓ $1.png" \
    || { rm -f "$1.png"; echo "  ✗ 실패 — 텍스트 폴백 유지 (수동으로 $1.png 추가 가능)"; }
}

try kaon  "kaonmedia.com"        # 가온그룹 (KAON)
try kodit "kodit.co.kr"          # 신용보증기금
try kosme "kosmes.or.kr"         # 중소벤처기업진흥공단
try kban  "kban.or.kr"           # 한국엔젤투자협회
try shbc  "suhyup-bank.com"      # 수협은행 (BC카드 병기는 텍스트 유지 시 별도)
# 미래수산밸류체인펀드(msvf)는 공식 로고가 없어 텍스트 폴백 사용

echo "완료. 실패 항목은 각사 홈페이지 CI/BI 자료실에서 받아 같은 파일명으로 넣어주세요."
