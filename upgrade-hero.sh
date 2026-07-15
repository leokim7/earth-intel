#!/bin/bash
# 히어로 이미지 2x 고해상도 교체 (선택, 1회 실행)
cd "/Users/leo/Documents/Claude/Projects/Bluebatrix/sgma-homepage/assets" || exit 1
curl -sL -o imgImage8.png "https://www.figma.com/api/mcp/asset/c85cceda-028c-477c-a992-94e28bac0503" && echo "imgImage8 2x OK"
curl -sL -o imgImage9.png "https://www.figma.com/api/mcp/asset/14e2c5e5-1ee5-46ab-92e7-e1fbe5871ac4" && echo "imgImage9 2x OK"
