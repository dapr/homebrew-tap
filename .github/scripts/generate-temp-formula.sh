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
  depends_on \"make\" => :build

  def install
    system \"make\", \"REL_VERSION=#{version}\"
    bin.install Dir[\"dist/*/release/dapr\"].first  => \"dapr\"
  end

  test do
    system \"#{bin}/dapr\", \"--version\"
  end
end
" > $(brew --repo)/Library/Taps/dapr/homebrew-tap/${FORMULA_FILENAME}