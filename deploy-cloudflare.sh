#!/bin/bash
# SGMA 홈페이지 → Cloudflare Pages 배포
# 사전 준비(최초 1회): npx wrangler login
set -e
DIR="/Users/leo/Documents/Claude/Projects/Bluebatrix/sgma-homepage"
cd "$DIR"

# 배포용 dist 구성 (내부 작업파일 제외: _ref, *.sh)
rm -rf dist && mkdir -p dist
cp index.html dist/
cp -R assets dist/assets
rm -f dist/assets/download_report.txt

# 배포 (프로젝트 없으면 자동 생성)
npx wrangler pages deploy dist --project-name=sgma-homepage --commit-dirty=true

echo ""
echo "완료 → https://sgma-homepage.pages.dev"
