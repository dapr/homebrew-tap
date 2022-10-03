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

class DaprCliAT190Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.9.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.9.0-rc.2.tar.gz"
  sha256 "3b0d43e054ce3035f64ac9b02901a81a57a8980bec453de1673c19ffe1196521"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.9.0-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur: "48d0877319b3bbff4e8c229a02cff37e02302ae78d6e6b84212dba514ac4c218"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

