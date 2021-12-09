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

class DaprCliAT140Rc1 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.4.0-rc.1'
  url "https://github.com/dapr/cli/archive/v1.4.0-rc.1.tar.gz"
  sha256 "7107c40a236b061637c342f10e5b92a0c33dc88c2ac320343de34b04139acb82"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "REL_VERSION=#{version}"
    bin.install Dir["dist/*/release/dapr"].first  => "dapr"
  end

  test do
    system "#{bin}/dapr", "--version"
  end
end

