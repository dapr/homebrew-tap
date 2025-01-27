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

class DaprCliAT1150Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.15.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.15.0-rc.3.tar.gz"
  sha256 "f5f33c236eb8b69f6a6fdf8c0acbba260f83a73cd29bc78f202abe9121c0c92d"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.15.0-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "03560a2a5f9d8833d36095e77aff76b973353d2f8a66e11dbf3b9eb58d0ca9f3"
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

