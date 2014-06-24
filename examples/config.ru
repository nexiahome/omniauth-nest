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

# Make sure to setup the ENV variables NEST_ID and NEST_SECRET
# Run with `bundle exec rackup`

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'omniauth-nest'

class NestApp < Sinatra::Base

  get '/' do
    <<-HTML
      <p><a href="/auth/nest">Sign into Nest</a></p>
    HTML
  end

  get '/auth/:provider/callback' do |provider|
    content_type 'text/plain'
    %{ #{provider} token: #{request.env['omniauth.auth'].to_hash['credentials'].inspect}
     } rescue 'No data returned'
  end

  get '/auth/failure' do
    content_type 'text/plain'
    %{ Error: #{request.env['omniauth.auth'].to_hash.inspect}
     } rescue 'No data returned'
  end
end

use Rack::Session::Cookie, :secret => ENV['RACK_COOKIE_SECRET']

use OmniAuth::Builder do
  provider :nest, ENV['NEST_ID'], ENV['NEST_SECRET']
end

run NestApp.new
