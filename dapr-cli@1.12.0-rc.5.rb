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

class DaprCliAT1120Rc5 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.12.0-rc.5'
  url "https://github.com/dapr/cli/archive/v1.12.0-rc.5.tar.gz"
  sha256 "66b0739dd97ec46fd76a5ec7569dae50fd2788b315e52f778de8bfd0dfa58794"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.12.0-rc.5"
    sha256 cellar: :any_skip_relocation, monterey: "c70c8775a456ced7af56b76afacc564c017c6484e742698e080e42bfd9eb5a02"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

