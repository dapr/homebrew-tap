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

class DaprCliAT180Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.8.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.8.0-rc.4.tar.gz"
  sha256 "009612e5d0e3d28bd15e608ee22349e52582c3fcd472ed8d7d1ca0504a00618f"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.8.0-rc.4"
    sha256 cellar: :any_skip_relocation, big_sur: "370a6423512b94ec11b71862530473924ffbdcf35a2dc1de97b3b91a43e9921d"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

