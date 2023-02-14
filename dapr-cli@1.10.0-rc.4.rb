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

class DaprCliAT1100Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.10.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.10.0-rc.4.tar.gz"
  sha256 "7b4d44e5294534753ba936149106427068a3819eab1604725dfe6f966af840f8"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.10.0-rc.4"
    sha256 cellar: :any_skip_relocation, monterey: "1b4c8847e72a0fad2860e2313887902a9f35b71f5d7a86a691ef7d409a85d28a"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

