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

class DaprCliAT1140Rc8 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.14.0-rc.8'
  url "https://github.com/dapr/cli/archive/v1.14.0-rc.8.tar.gz"
  sha256 "5dd0be64fd58cde0724f3d86371c65aaa44550d7bec67b95a9ffa25b4febe12d"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.14.0-rc.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b89467053f2cf8f3f461a2b832aad61873292bdb3c1f6507714598e843fccf5d"
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

