#!/bin/bash

# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

set -ue

echo "# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

class ${FORMULA_CLASSNAME} < Formula
  desc \"Client for Dapr.\"
  homepage \"https://dapr.io\"
  version '${DAPR_CLI_VERSION}'
  url \"https://github.com/dapr/cli/archive/v${DAPR_CLI_VERSION}.tar.gz\"
  sha256 \"${DAPR_CLI_SRC_SHASUM}\"

  depends_on \"go\" => :build

  bottle do
    root_url \"https://github.com/dapr/homebrew-tap/releases/download/v${DAPR_CLI_VERSION}\"
    sha256 cellar :any_skip_relocation, ${DAPR_CLI_BOTTLE_OS_VERSION}: \"${DAPR_CLI_BOTTLE_SHASUM}\"
  end

  def install
    system \"go\", \"build\", \"-ldflags\", \"-X main.version=#{version} -X main.apiVersion=1.0\", \"-o\", \"./cli\"
    bin.install \"cli\" => \"dapr\"
  end

  test do
    system \"#{bin}/dapr\", \"--version\"
  end
end
" > ${FORMULA_FILENAME}