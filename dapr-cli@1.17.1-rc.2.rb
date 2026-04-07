# ------------------------------------------------------------
# Copyright 2026 The Dapr Authors
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

class DaprCliAT1171Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.17.1-rc.2'
  url "https://github.com/dapr/cli/archive/v1.17.1-rc.2.tar.gz"
  sha256 "0bc1e734e4c9c8848b6fca96770134737092bbc990989207e6a1eb17d56e9878"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.17.1-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f21e8c0b802cda7e6cf7bc8435eb921932a4cec1101b51d0181de8d250a204c7"
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

