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

class DaprCliAT1110Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.11.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.11.0-rc.3.tar.gz"
  sha256 "735b7972566afa427054772496a433d7dc89ec76c45c7539bab40ec9eceee4e5"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.11.0-rc.3"
    sha256 cellar: :any_skip_relocation, monterey: "89de909b5d1440953d5492ace6f75aa0852c12baaba3d050a46caea5bcd8b07a"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

