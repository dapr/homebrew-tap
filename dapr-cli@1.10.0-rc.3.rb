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

class DaprCliAT1100Rc3 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.10.0-rc.3'
  url "https://github.com/dapr/cli/archive/v1.10.0-rc.3.tar.gz"
  sha256 "2dcfa5377f845ea42bd20e7a15b5c5b7ffca042ad002185425185b44fa2c6f28"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.10.0-rc.3"
    sha256 cellar: :any_skip_relocation, monterey: "24a272a02000cf336d910125e85eb280dd04dbdb27ee7075e99673daa0f80168"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

