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

class DaprCliAT1100Rc6 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.10.0-rc.6'
  url "https://github.com/dapr/cli/archive/v1.10.0-rc.6.tar.gz"
  sha256 "6902052bc2e61a4abf452fbb2639ed28b83a5b0ddf2a4333ae90f4e7afede5a9"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.10.0-rc.6"
    sha256 cellar: :any_skip_relocation, monterey: "f4d514cc37d02ae95049ff7afc8b3f17091d66d4d9ee645bbb18ecdfb2fa0f86"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

