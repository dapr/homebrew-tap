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

class DaprCliAT1120Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.12.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.12.0-rc.1.tar.gz"
  sha256 "e6963198031018485f2f7395119949966d25431c048fd86cff43f9b706869923"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.12.0-rc.1"
    sha256 cellar: :any_skip_relocation, monterey: "cfa7de40418184e29047eb1893f6afa0257fc47f8657d6c59937748aa973b313"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

