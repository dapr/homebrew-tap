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

class DaprCliAT190Rc5 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.9.0-rc.5'
  url "https://github.com/dapr/cli/archive/v1.9.0-rc.5.tar.gz"
  sha256 "9a5ce008631ca39e49ad6eb8f0ae457100d7f280304c4675bf430909c7991437"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.9.0-rc.5"
    sha256 cellar: :any_skip_relocation, big_sur: "01e6d3ba5815e00336de4d76739f5f2bfd21f4e3d922272ad327b003c5f38c47"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

