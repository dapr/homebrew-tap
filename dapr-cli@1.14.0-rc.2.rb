# ------------------------------------------------------------
# Copyright 2024 The Dapr Authors
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

class DaprCliAT1140Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.14.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.14.0-rc.2.tar.gz"
  sha256 "8c99717567298c91aa55022a2fb5e70c7f865b7d7bde9246d9a3f9658ba21da5"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.14.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5c4cb718f7160ecc00e3ebb58417270cb048ddaa86b27a19c649ff3b6e425823"
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

