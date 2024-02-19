# ------------------------------------------------------------
# Copyright 2024 The Dapr Authors
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

class DaprCliAT1130Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.13.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.13.0-rc.1.tar.gz"
  sha256 "9faa115a87a9f33203238fd67d067de86ed5d18e7a541b09acad167083757135"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.13.0-rc.1"
    sha256 cellar: :any_skip_relocation, monterey: "a3ad77e7c1860069360e9fc0374101348a31aa20396cb26130f9ede012db53d9"
  end

  def install
    with_env(
     "GOPROXY" => ENV["HOMEBREW_GOPROXY"] ? ENV["HOMEBREW_GOPROXY"] : ENV["GOPROXY"],
    ) do
      system "make", "REL_VERSION=#{version}"
    end
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

