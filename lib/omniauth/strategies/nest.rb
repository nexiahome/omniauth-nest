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

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Nest < OmniAuth::Strategies::OAuth2

      option :name, "nest"

      option :client_options, {
        :site          => "https://api.home.nest.com",
        :authorize_url => 'https://home.nest.com/login/oauth2',
        :token_url     => '/oauth2/access_token'
      }

      def authorize_params
        params = super.merge(state: request.params["state"])
        session["omniauth.state"] = params[:state]
        params
      end

      def callback_phase # rubocop:disable AbcSize, CyclomaticComplexity, MethodLength, PerceivedComplexity
        session["omniauth.expected_state"] = session["omniauth.state"]
        super
      end
    end
  end
end
