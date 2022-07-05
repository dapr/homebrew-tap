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

class DaprCliAT180Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.8.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.8.0-rc.3.tar.gz"
  sha256 "1f30c1f5b5b852a9ab4520ca193d963ca0f0ee0df4328b167efd26a5b3827007"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.8.0-rc.3"
    sha256 cellar: :any_skip_relocation, big_sur: "88255e5b312d3edf33e20ced823ddd14ff3215383aadf81f4184c6a6c32ea1e8"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

