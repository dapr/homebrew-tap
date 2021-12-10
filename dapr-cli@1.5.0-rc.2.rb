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

class DaprCliAT150Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.5.0-rc.2.tar.gz"
  sha256 "6eed2fcded4d68e79a0b8b497392e70cb21671658a93f08fda5788a303f75972"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.0-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur: "2a0fd848c5489641fd203d7d3d7b3507e8b6726a495a32c84af1456eb509d7f0"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

