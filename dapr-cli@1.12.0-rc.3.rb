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

class DaprCliAT1120Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.12.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.12.0-rc.3.tar.gz"
  sha256 "8cf873c56ef6cfb617c7c3f8904a2c2e534e0790e3d695ce0ef2a27825e025fc"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.12.0-rc.3"
    sha256 cellar: :any_skip_relocation, monterey: "1ee7f5ad02b87d7c949b9f6bf0157d7f7913e2e08c6b46e484eeeeab552e31ba"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

