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

class DaprCliAT1160Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.16.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.16.0-rc.1.tar.gz"
  sha256 "3c666bb0deac9882c864477000d5641d5bd93cdd2e86ca856ce98b37fee41335"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.16.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "34edfb0512ec88980e86b7168165ab048c597c833a0e1609f3237d82e618b295"
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

