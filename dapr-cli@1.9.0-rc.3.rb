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

class DaprCliAT190Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.9.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.9.0-rc.3.tar.gz"
  sha256 "a9e2c4b1f97c52f02639425e6dc8fedecd76ffe9d738c274ad24aecfb57d3ab9"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.9.0-rc.3"
    sha256 cellar: :any_skip_relocation, big_sur: "ffc097afa4acc8c9641d85db56358df8eb5f8befc8e0c9c4d06dbbb163cc47bc"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

