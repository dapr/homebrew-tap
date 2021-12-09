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

class DaprCliAT150Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.5.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.5.0-rc.1.tar.gz"
  sha256 "66ad561e8e84f600704efca7c1d80c2c6003c723fe4433672307d4a4f1f11f3a"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.5.0-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur: "db7a3e3836d6c2e2f1bd1248353cb3ed9c3c7921c3736fd877939e4072fe83bf"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

