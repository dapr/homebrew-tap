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

class DaprCliAT1120Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.12.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.12.0-rc.4.tar.gz"
  sha256 "b9de9e6328916cb8eac4295bb9fbc354eaad7decc8e76974a7ec829ee62b7bbe"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.12.0-rc.4"
    sha256 cellar: :any_skip_relocation, monterey: "95405d20549e0f4060f50534d2adf7aaae99fb8e70850208589a0ed1807d94f6"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

