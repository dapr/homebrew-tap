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

class DaprCliAT170Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.7.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.7.0-rc.1.tar.gz"
  sha256 "a8a1acb146cbebfcf4f118cba4b2836e48d143715eb8ce6966429a0cb5ce7d53"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.7.0-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur: "58c908416fb689e5ba55ae18c93706f46062b8fcfac536214d2d76ac83410777"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

