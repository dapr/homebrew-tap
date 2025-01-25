# ------------------------------------------------------------
# Copyright 2025 The Dapr Authors
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

class DaprCliAT1150Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.15.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.15.0-rc.2.tar.gz"
  sha256 "76fa16134e41087b422b0332c02eff0e529a417a1073c602994ad1ee228e446c"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.15.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f5542548879256a2d7a8ddb99177a9d5a4402be230b900301fd2f68358442320"
  end

  def install
    with_env(
     "GOPROXY" => ENV["HOMEBREW_GOPROXY"] ? ENV["HOMEBREW_GOPROXY"] : ENV["GOPROXY"],
    ) do
      system "make", "REL_VERSION=#{version}"
    end
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

