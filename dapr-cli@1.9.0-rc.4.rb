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

class DaprCliAT190Rc4 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.9.0-rc.4'
  url "https://github.com/dapr/cli/archive/v1.9.0-rc.4.tar.gz"
  sha256 "209ddc8261f614edf9935165b85787da02521bff9b14f126aa3c63769009644a"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.9.0-rc.4"
    sha256 cellar: :any_skip_relocation, big_sur: "65bc18769d1f3ae3b51c71bc62088784455699506b962af0f278e5a39988b23b"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

