# OmniAuth Nest Strategy

Strategy to authenticate with Nest via OAuth2 in OmniAuth

Get your API key at: https://developer.nest.com/clients

For more details, read the Nest authorization documentation at https://developer.nest.com/support/authorization-overview

## Installation

Add to your `Gemfile`:

````ruby
gem 'omniauth-nest'
````

then `bundle install`.


## Example

1. Clone this repo and `cd` into it
2. `bundle install` (Required [bundler gem](http://bundler.io/))
3. `cd examples`
4. Set ENV variables for NEST_ID and NEST_SECRET
5. Set redirect URI to http://localhost:9292/auth/nest/callback
6. `bundle exec rackup`
7. Open http://localhost:9292 in your browser and follow links

## Usage

In Rails add the following to `config/initializers/omniauth.rb`

````ruby
use OmniAuth::Builder do
  provider :nest, ENV['NEST_ID'], ENV['NEST_SECRET']
end
````

This will enable the route `/auth/nest` which will start the OAuth2 flow. See `examples/config.ru` for a fully working example.

NOTE: The Nest OAuth2 service only returns authorization tokens for the Nest API, not user identification.

## License
Copyright 2014 Nest Labs Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
