#!/bin/bash
set -e
GITHUB_USERNAME="JAINISHSHAH-LANG"
GITHUB_REPO="llm-analysis-quiz"
GITHUB_URL="https://github.com/$GITHUB_USERNAME/$GITHUB_REPO"

echo "========================================"
echo "Deployment for $GITHUB_USERNAME"
echo "========================================"

git config core.autocrlf true 2>/dev/null || true
if [ ! -d ".git" ]; then git init; fi
git add . 2>/dev/null || true
git commit -m "Initial commit" 2>/dev/null || git commit --allow-empty -m "Initial commit" || true
git remote remove origin 2>/dev/null || true
git remote add origin "$GITHUB_URL.git"
git branch -M main 2>/dev/null || true

echo ""
echo "ACTION REQUIRED:"
echo "1. Go to: https://github.com/new"
echo "2. Create repository: llm-analysis-quiz (PUBLIC)"
echo "3. DO NOT add README/license"
echo "4. Press ENTER here after creating..."
read

echo "Pushing to GitHub..."
git push -u origin main || echo "Push failed - try: git push -u origin main"

echo ""
echo "Next: Deploy to Railway"
echo "1. Go to: https://railway.app"
echo "2. New Project → Deploy from GitHub"
echo "3. Select: llm-analysis-quiz"
echo "4. Add environment variables (see script output)"
