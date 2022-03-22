#!/bin/bash

ACTION=$1

if [ "$ACTION" == "android" ]
then
  # Sleep to allow emulator to settle.
  sleep 15
  melos exec -c 1 --fail-fast qualitycheck
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