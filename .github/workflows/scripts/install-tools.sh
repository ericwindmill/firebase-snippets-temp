#!/bin/bash

flutter config --no-analytics --no-enable-web --no-enable-ios --no-enable-macos
flutter pub global activate melos 1.1.0
echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/.pub-cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/bin/cache/dart-sdk/bin" >> $GITHUB_PATH