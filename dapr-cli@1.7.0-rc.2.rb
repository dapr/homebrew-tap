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

class DaprCliAT170Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.7.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.7.0-rc.2.tar.gz"
  sha256 "2f2aa142c81750334ee8e04c77f221f301cc6d9316c8c3e9a6851c6d07e9e754"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.7.0-rc.2"
    sha256 cellar: :any_skip_relocation, big_sur: "c8ef33d014259d250f4ece38b6293edda208b456e9d9dc31639a967baa9ad791"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

