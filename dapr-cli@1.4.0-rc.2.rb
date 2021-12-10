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

class DaprCliAT140Rc2 < Formula
  desc "Client for Dapr."
  homepage "https://dapr.io"
  version '1.4.0-rc.2'
  url "https://github.com/dapr/cli/archive/v1.4.0-rc.2.tar.gz"
  sha256 "0d876a70de55032895aff4caa9fb2b00e26dae119c6c4c79ebff7d5352081198"

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

