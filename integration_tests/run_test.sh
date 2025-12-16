#!/usr/bin/env bash

set -euo pipefail

RED='\033[1;31m'
BLUE='\033[1;34m'
END='\033[0m'

if [ "$(git branch --show-current)" = "main" ]; then
  echo "${RED}error: must be on a feature branch${END}"
  exit 1
fi
if [ "$(git status --short)" != "" ]; then
  echo "${RED}error: branch is dirty${END}"
  exit 1
fi

echo -e "\n${BLUE}on feature branch${END}"
git status

echo -e "\n${BLUE}switch to main branch${END}"
git switch main --quiet
rm -rf prod-artifacts/
git status

echo -e "\n${BLUE}switch back to feature branch${END}"
git switch - --quiet
git status
