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

class DaprCliAT1110Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.11.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.11.0-rc.2.tar.gz"
  sha256 "8dc4bc86bef5b566442f96ad8d7f184086e430160bdbcfb125c341b8af3a4c72"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.11.0-rc.2"
    sha256 cellar: :any_skip_relocation, monterey: "07f4cbd8cd98e1b1bd026fae2936887ab9719f82568d169d5f1c0b21ba9d5335"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

