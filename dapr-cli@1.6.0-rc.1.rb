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

class DaprCliAT160Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.6.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.6.0-rc.1.tar.gz"
  sha256 "c60f4bc331c6c675ae600392bf9186e0529d06fd3fdc18e44f97469cd207440e"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
    root_url "https://github.com/dapr/homebrew-tap/releases/download/v1.6.0-rc.1"
    sha256 cellar: :any_skip_relocation, big_sur: "82052feaf745227e8569738cb9b291dcde20826d013e9c5e42ce62b5a8328ad1"
  end

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

