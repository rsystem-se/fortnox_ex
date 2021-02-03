#!/bin/sh

openapi-generator generate -i fortnox_openapi/api-docs.yaml -g elixir -c openapi-generator-config.json -o .
git checkout .gitignore README.md mix.exs lib/fortnox_ex/connection.ex
