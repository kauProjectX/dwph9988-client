#!/bin/bash

set -ex

curl https://dwph9988.shop/swagger.json > api-docs.json
openapi-generator generate -i api-docs.json -g dart-dio -o api
pushd api
fvm dart run build_runner build
popd
rm api-docs.json
