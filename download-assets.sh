#!/bin/bash
# SGMA homepage — Figma asset downloader (한 번만 실행)
set -u
DIR="/Users/leo/Documents/Claude/Projects/Bluebatrix/sgma-homepage"
mkdir -p "$DIR/assets" "$DIR/_ref"
cd "$DIR/assets"
ok=0; fail=0
dl() {
  local name="$1" url="$2"
  curl -sL --retry 2 -o "_tmp_$name" "$url"
  if [ ! -s "_tmp_$name" ]; then echo "FAIL $name" >> download_report.txt; rm -f "_tmp_$name"; fail=$((fail+1)); return; fi
  local mime=$(file -b --mime-type "_tmp_$name")
  local ext="bin"
  case "$mime" in
    image/png) ext="png";; image/jpeg) ext="jpg";; image/svg+xml|text/xml|text/plain|text/html) ext="svg";;
    image/gif) ext="gif";; image/webp) ext="webp";;
  esac
  mv "_tmp_$name" "$name.$ext"
  echo "OK $name.$ext $mime" >> download_report.txt; ok=$((ok+1))
}
rm -f download_report.txt
dl "img1Fish" "https://www.figma.com/api/mcp/asset/273d274f-6104-4abf-bc18-1cf45efa281a"
dl "imgUnsplash4Zxp5VlmvnI1" "https://www.figma.com/api/mcp/asset/3635a99e-d3ec-430a-bc67-0ed4e2519e3f"
dl "imgUnsplashIqvfvh0Ajag" "https://www.figma.com/api/mcp/asset/fff00bb5-c25a-40dc-846c-851da920ba0c"
dl "imgUnsplash82ZiY5Pzl1C" "https://www.figma.com/api/mcp/asset/6894880a-5119-42e1-89b9-19d9cb00ff43"
dl "imgUnsplashNBnvQW18" "https://www.figma.com/api/mcp/asset/c3e4f53d-3084-442a-b260-c61730bbe33f"
dl "imgUnsplashYv593OyMKmo" "https://www.figma.com/api/mcp/asset/f075aefa-6387-41c1-8f5d-951430ed44bc"
dl "imgImage9" "https://www.figma.com/api/mcp/asset/23f30576-1fda-4dd1-9af0-c4c33ebedab5"
dl "imgImage8" "https://www.figma.com/api/mcp/asset/73910805-149e-4708-a9ab-ffe84270eb9c"
dl "imgUnsplashUdVjzhI9GXs" "https://www.figma.com/api/mcp/asset/74d78afb-2e10-43af-8c38-95e89f954e7e"
dl "imgUnsplashUdVjzhI9GXs1" "https://www.figma.com/api/mcp/asset/640d16b4-35b2-46b5-94cd-8a9f4958bc92"
dl "imgUnsplashDupFowqI6OI" "https://www.figma.com/api/mcp/asset/1d972d24-a15f-4473-96f0-b618d540ceff"
dl "imgUnsplashDupFowqI6OI1" "https://www.figma.com/api/mcp/asset/ceaf0673-f550-41ee-a02e-c7fe699b67d8"
dl "imgUnsplashOh0DitWoHi4" "https://www.figma.com/api/mcp/asset/6a291ae9-b262-4093-a13a-5738877273b9"
dl "imgUnsplashOh0DitWoHi5" "https://www.figma.com/api/mcp/asset/8787379c-f518-404e-8cc1-4a34fe4c0409"
dl "img" "https://www.figma.com/api/mcp/asset/1cd0d5e7-05f4-43a2-af98-49080d8d7c34"
dl "img1" "https://www.figma.com/api/mcp/asset/dc5003e9-569e-4f5f-8b24-eecea2e0d890"
dl "img3" "https://www.figma.com/api/mcp/asset/e9cfc785-cb85-40a3-a2b7-475e7b96cd83"
dl "imgRectangle" "https://www.figma.com/api/mcp/asset/6b82f6a4-9094-4d4a-b7cc-bc3929c4edfe"
dl "imgImage16" "https://www.figma.com/api/mcp/asset/ecdb6295-c9b1-4702-84b1-4f2ddc6b1b7c"
dl "imgPluginFileCover1" "https://www.figma.com/api/mcp/asset/30ab87af-6a8e-421c-826a-bd6a20feb5d0"
dl "imgUnsplash4Zxp5VlmvnI" "https://www.figma.com/api/mcp/asset/43ff18a3-1562-49ba-92bb-6bd6569c8725"
dl "imgLine3" "https://www.figma.com/api/mcp/asset/87b4a587-addf-4ae1-9a67-cbf2e51c7c8c"
dl "imgRectangle5" "https://www.figma.com/api/mcp/asset/d1f62a48-06bf-4174-9e72-2c0637bf7e12"
dl "imgEllipse" "https://www.figma.com/api/mcp/asset/8cd8247a-2135-411a-94c2-dc4bd6c5b509"
dl "imgEllipse1" "https://www.figma.com/api/mcp/asset/095127d4-1823-4c32-8ade-cdc2f9a51db3"
dl "imgGroup1" "https://www.figma.com/api/mcp/asset/05dcd736-b554-4dbb-ad0b-a790cfc38b6d"
dl "imgEllipse2" "https://www.figma.com/api/mcp/asset/70f2a2e6-6245-4bd2-9603-7ae9802b4e73"
dl "imgLine2" "https://www.figma.com/api/mcp/asset/fe2ad884-58a8-4e61-9b34-b654a6b536fe"
dl "imgLine4" "https://www.figma.com/api/mcp/asset/57dab1c9-a907-4a39-9dbf-e64c54d89344"
dl "imgEllipse3" "https://www.figma.com/api/mcp/asset/c23cdbe5-d113-4133-a626-9535053d9a52"
dl "img2" "https://www.figma.com/api/mcp/asset/89f54ac2-6bbf-4a28-8fe4-36d140e09a9c"
dl "imgSizeTargetBox" "https://www.figma.com/api/mcp/asset/37d80453-3ccc-40a4-8101-c5f0f1e0526c"
dl "imgLine5" "https://www.figma.com/api/mcp/asset/1cab0b40-8df6-45c3-9214-c0b679c41df5"
dl "imgRiBuildingFill" "https://www.figma.com/api/mcp/asset/acbffb79-5387-4dc6-be25-de19eb710faf"
dl "imgSolarGlobalBold" "https://www.figma.com/api/mcp/asset/ef6290ee-68df-40fc-b253-b6718ed5097f"
dl "imgBoxiconsPlanetFilled" "https://www.figma.com/api/mcp/asset/1a7a7142-d4a1-46bb-a5c1-1df480329f66"
dl "imgLine6" "https://www.figma.com/api/mcp/asset/41a1d375-305e-4f80-8edb-3bf7b040a30a"
dl "imgLine7" "https://www.figma.com/api/mcp/asset/cca38067-d33d-4772-8cc5-41dd79e561f2"
dl "imgLine8" "https://www.figma.com/api/mcp/asset/e5c9489e-9377-4f38-b354-014dfad5a584"
dl "imgImage16Partner" "https://www.figma.com/api/mcp/asset/c997bd7b-4b9c-40a3-aa6c-6e660dbb88cb"
dl "imgLine5Footer" "https://www.figma.com/api/mcp/asset/4e94f34b-2a40-4691-a977-af2da49bf3dd"
curl -sL -o "$DIR/_ref/figma_full_page.png" "https://www.figma.com/api/mcp/asset/e962d5ad-ca25-4810-824b-1ba5aee2aa6e"
echo "DONE ok=$ok fail=$fail" >> download_report.txt
echo "완료: 성공 $ok / 실패 $fail  (assets/download_report.txt 확인)"