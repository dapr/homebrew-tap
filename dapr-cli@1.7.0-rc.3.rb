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

class DaprCliAT170Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.7.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.7.0-rc.3.tar.gz"
  sha256 "7c57eebc92c4f8f4137dc438dd735df7be7f89f9bb7d4fc38c6111a2d945b961"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.7.0-rc.3"
    sha256 cellar: :any_skip_relocation, big_sur: "0b318b59f7e6f5a6fcc59e83c9bc33b77faa9189fb77c9eff17a6f4b6f90b9d8"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

