module TgtgMicroservice
  module Requests
    class Authorization
      attr_reader :user
      ENDPOINT = 'authorize'

      def initialize(user)
        @user = user
      end

      def call
        return if user.tgtg_active

        response = client.post("/#{ENDPOINT}") do |req|
          req.body = {
            user_id: user.id,
            email: user.email
          }.to_json
        end

        return unless response.status == 201

        response_body = JSON.parse response.body
        response_body['user_id']
      end

      private

      def client
        Faraday.new(
          url: ENV['TGTG_MICROSERVICE_URL'],
          headers: {'Content-Type' => 'application/json'}
        )
      end
    end
  end
end