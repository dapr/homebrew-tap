#!/bin/bash

# ------------------------------------------------------------
# Copyright 2022 The Dapr Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------

set -ue

echo "# ------------------------------------------------------------
# Copyright 2022 The Dapr Authors
# Licensed under the Apache License, Version 2.0 (the \"License\");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an \"AS IS\" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------

class ${FORMULA_CLASSNAME} < Formula
  desc \"Client for Dapr.\"
  homepage \"https://dapr.io\"
  version '${DAPR_CLI_VERSION}'
  url \"https://github.com/dapr/cli/archive/v${DAPR_CLI_VERSION}.tar.gz\"
  sha256 \"${DAPR_CLI_SRC_SHASUM}\"

  depends_on \"go\" => :build
  depends_on \"make\" => :build

  bottle do
    root_url \"https://github.com/dapr/homebrew-tap/releases/download/v${DAPR_CLI_VERSION}\"
    sha256 cellar: :any_skip_relocation, ${DAPR_CLI_BOTTLE_OS_VERSION}: \"${DAPR_CLI_BOTTLE_SHASUM}\"
  end

  def install
    system \"make\", \"REL_VERSION=#{version}\"
    bin.install Dir[\"dist/*/release/dapr\"].first  => \"dapr\"
  end

  test do
    system \"#{bin}/dapr\", \"--version\"
  end
end
" > ${FORMULA_FILENAME}
