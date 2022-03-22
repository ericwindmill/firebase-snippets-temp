#!/bin/bash

ACTION=$1
DEFAULT_TARGET="./apps/firestore_snippets/integration_test/app_test.dart"

if [ "$ACTION" == "android" ]
then
  # Sleep to allow emulator to settle.
  sleep 15
  melos exec -c 1 --fail-fast --scope="$FLUTTERFIRE_PLUGIN_SCOPE_EXAMPLE" --dir-exists=test_driver -- \
    flutter test $FLUTTER_COMMAND_FLAGS --no-pub --target=.$DEFAULT_TARGET --dart-define=CI=true
  exit
fi

if [ "$ACTION" == "ios" ]
then
  echo "❌ Running tests on iOS not implemented for actions"
  exit 1
fi

if [ "$ACTION" == "macos" ]
then
  echo "❌ Running tests on macos not implemented for actions"
  exit 1
fi

if [ "$ACTION" == "web" ]
then
  echo "❌ Running tests on web not implemented for actions"
  exit 1
fi