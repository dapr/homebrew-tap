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

class DaprCliAT1120Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.12.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.12.0-rc.2.tar.gz"
  sha256 "f2dd1be5e69fa6fb2ccd9aad324bf46727efb4628298ece3ce39f7fff55b2e8a"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.12.0-rc.2"
    sha256 cellar: :any_skip_relocation, monterey: "98c8422dc83db095843ea07904785dc5f10a8755243c47970b053358f98a93f4"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

