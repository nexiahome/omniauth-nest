# encoding: UTF-8

# Copyright 2014 Nest Labs Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.expand_path(File.join('..', 'lib', 'omniauth', 'nest', 'version'), __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.authors       = ['David W. Keith']
  gem.email         = ['dwk@nestlabs.com']
  gem.description   = 'The Nest strategy for OmniAuth'
  gem.summary       = 'The Nest strategy for OmniAuth 1.x'

  gem.files         = `git ls-files`.split("\n")
  gem.name          = 'omniauth-nest'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Nest::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  gem.add_development_dependency 'rake'
end
