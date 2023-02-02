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

class DaprCliAT1100Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.10.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.10.0-rc.2.tar.gz"
  sha256 "eb0de95924737b2c3532bfaada20e9b6b33b905c9106c35a8142c1dc5bdeec3f"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.10.0-rc.2"
    sha256 cellar: :any_skip_relocation, monterey: "5ac0d29a2969503a12127fd6e8d133d35e3921a1a84b1264ea5601f2c5ab095f"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

