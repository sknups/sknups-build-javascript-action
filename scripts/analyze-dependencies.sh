#!/usr/bin/env bash

DEPENDENCIES=$(jq -r ' (.devDependencies // {}, .dependencies // {} ) | keys[]' package.json)

if grep -q "@sknups-internal/" <<< "$DEPENDENCIES" ; then
  echo "authenticate=true" >> "$GITHUB_OUTPUT"
else
  echo "authenticate=false" >> "$GITHUB_OUTPUT"
fi
