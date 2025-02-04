# ------------------------------------------------------------
# Copyright 2025 The Dapr Authors
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

class DaprCliAT1150Rc5 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.15.0-rc.5'
  url "https://github.com/dapr/cli/archive/v1.15.0-rc.5.tar.gz"
  sha256 "42327d877aa9be5d28268ec5f2d1b2cd82e89f70876d94acdb2d7f2bedb00350"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.15.0-rc.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "27f4eee0ef9d5c53a4a7fb8511e5ddc013b292856d15870ed8fe6090f04f6782"
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

