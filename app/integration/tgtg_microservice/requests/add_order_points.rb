module TgtgMicroservice
  module Requests
    class AddOrderPoints
      attr_reader :user
      ENDPOINT = 'users'
      POINTS_PER_ORDER = 100

      def initialize(user)
        @user = user
      end

      def call
        return unless user.tgtg_active

        response = Faraday.get("#{ENV['TGTG_MICROSERVICE_URL']}/#{ENDPOINT}/#{user.id}")
        return nil unless response.status == 200

        response_body = JSON.parse response.body
        response_body['number_of_unmarked_orders'] * POINTS_PER_ORDER
      end
    end
  end
end