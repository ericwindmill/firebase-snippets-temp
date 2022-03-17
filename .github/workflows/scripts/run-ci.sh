#!/bin/bash

if ! [ -x "$(command -v firebase)" ]; then
  echo "❌ Firebase tools CLI is missing."
  exit 1
fi

if ! [ -x "$(command -v flutter)" ]; then
  echo "❌ Flutter tools CLI is missing."
  exit 1
fi

echo "Whoa, we made it"
exit 0