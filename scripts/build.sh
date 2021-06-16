#!/bin/bash

npx conventional-changelog-cli -p angular -i CHANGELOG.md -s -r 0
flutter build ios --no-tree-shake-icons
flutter build apk --no-tree-shake-icons
