#!/bin/bash

# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

set -ue

echo "${DAPR_CLI_VERSION}" | grep "\-rc" > /dev/null &&  echo "${DAPR_CLI_VERSION}" | sed -e 's/[\.\-]//g' | sed -e 's/r/R/' | xargs -I {} echo "DaprCliAT{}" || echo "DaprCli"