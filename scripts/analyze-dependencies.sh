#!/usr/bin/env bash

DEPENDENCIES=$(jq -r ' (.devDependencies // {}, .dependencies // {} ) | keys[]' package.json)

if grep -q "@sknups-internal/" <<< "$DEPENDENCIES" ; then
  echo "authenticate=true" >> "$GITHUB_OUTPUT"
  echo "this project depends on package(s) scoped '@sknups-internal'"
else
  echo "authenticate=false" >> "$GITHUB_OUTPUT"
fi
