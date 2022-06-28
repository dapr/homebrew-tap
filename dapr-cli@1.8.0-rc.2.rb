# ------------------------------------------------------------
# Copyright 2021 The Dapr Authors
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

class DaprCliAT180Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.8.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.8.0-rc.2.tar.gz"
  sha256 "37f6e6f496e1edbc0b6af5da2b6212cd74c1a064e969a67e4789bf447efc94cf"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.8.0-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur: "5e25703f5a57fb6f808db6523dcf7fdc583e566d0e54d347f5ece9606ededea9"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

