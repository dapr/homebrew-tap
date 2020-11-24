#!/bin/bash

# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

set -ue

echo "${DAPR_CLI_VERSION}" | grep "\-rc" > /dev/null &&  echo "${DAPR_CLI_VERSION}" | xargs -I {} echo "dapr-cli@{}" || echo "dapr-cli"