#!/bin/bash

DEFAULT_TARGET="./apps/firestore_snippets/integration_test/app_test.dart"

ACTION=$1
TARGET_FILE=${2:-$DEFAULT_TARGET}


if [ "$ACTION" == "android" ]
then
  flutter build apk $FLUTTER_COMMAND_FLAGS --debug --target="$TARGET_FILE" --dart-define=CI=true --no-android-gradle-daemon
  pkill dart || true
  pkill java || true
fi

if [ "$ACTION" == "ios" ]
then
  flutter build ios $FLUTTER_COMMAND_FLAGS --no-codesign --simulator --debug --target="$TARGET_FILE" --dart-define=CI=true
  exit
fi

if [ "$ACTION" == "macos" ]
then
  flutter build macos $FLUTTER_COMMAND_FLAGS --debug --target="$TARGET_FILE" --device-id=macos --dart-define=CI=true
  exit
fi