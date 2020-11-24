#!/bin/bash

# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

set -ue

echo "${DAPR_CLI_VERSION}" | grep "\-rc" > /dev/null && echo "dapr-cli@${DAPR_CLI_VERSION}.rb" || echo "dapr-cli.rb"