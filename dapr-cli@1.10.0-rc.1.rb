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

class DaprCliAT1100Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.10.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.10.0-rc.1.tar.gz"
  sha256 "2627a251bc448b10cc4c9e38f39a55c88c75edfbd2f35a622cea748689a02b81"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.10.0-rc.1"
    sha256 cellar: :any_skip_relocation, monterey: "9e63f280119234538007591ee171bd29d90cb50ee6775dc15e12739fbdb24aa8"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

