#!/bin/bash

# Matching Data Extractor 자동 설치 스크립트
# 이 파일을 더블클릭하면 자동으로 설치가 진행됩니다

clear

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  🚀 Matching Data Extractor 자동 설치 도우미"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# DMG 파일 경로
DMG_FILE="$HOME/Downloads/Matching-Data-Extractor-1.0.0-mac.dmg"

# 1단계: DMG 파일 확인
echo "📋 1단계: DMG 파일 확인 중..."
echo ""

if [ ! -f "$DMG_FILE" ]; then
    echo "❌ DMG 파일을 찾을 수 없습니다"
    echo ""
    echo "다음을 확인하세요:"
    echo "  • DMG 파일을 먼저 다운로드했는지"
    echo "  • 파일이 Downloads 폴더에 있는지"
    echo "  • 파일명이 'Matching-Data-Extractor-1.0.0-mac.dmg'인지"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    read -p "아무 키나 눌러 종료... " -n1
    echo ""
    exit 1
fi

echo "✅ DMG 파일 발견!"
echo "   위치: ~/Downloads/$(basename "$DMG_FILE")"
echo ""

# 2단계: macOS 보안 속성 제거
echo "📋 2단계: macOS 보안 속성 제거 중..."
echo ""

# quarantine 속성 확인
if xattr "$DMG_FILE" 2>/dev/null | grep -q "com.apple.quarantine"; then
    echo "🔓 보안 속성(quarantine)을 제거하는 중..."
    xattr -d com.apple.quarantine "$DMG_FILE" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "✅ 보안 속성 제거 완료!"
    else
        echo "⚠️  보안 속성 제거 실패 (하지만 계속 진행합니다)"
    fi
else
    echo "✅ 보안 속성이 없습니다 (제거 불필요)"
fi
echo ""

# 3단계: DMG 파일 열기
echo "📋 3단계: DMG 파일 여는 중..."
echo ""

open "$DMG_FILE"

if [ $? -eq 0 ]; then
    echo "✅ DMG 파일이 열렸습니다!"
else
    echo "⚠️  DMG 파일 열기 실패"
    echo "   수동으로 DMG 파일을 더블클릭해 주세요"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  ✅ 설치 준비 완료!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "다음 단계:"
echo ""
echo "  1️⃣  열린 창에서 'Matching Data Extractor' 아이콘을"
echo "      'Applications' 폴더로 드래그하세요"
echo ""
echo "  2️⃣  Applications 폴더로 이동"
echo ""
echo "  3️⃣  'Matching Data Extractor' 아이콘을 우클릭 → '열기' 선택"
echo ""
echo "  4️⃣  '열기' 버튼 클릭 → 설치 완료! 🎉"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "아무 키나 눌러 종료... " -n1
echo ""
echo ""
echo "설치를 완료해 주셔서 감사합니다!"
echo ""
