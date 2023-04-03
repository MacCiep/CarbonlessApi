module TgtgMicroservice
  module Requests
    class RefreshAccess
      attr_reader :user
      ENDPOINT = 'authorize'

      def initialize(user)
        @user = user
      end

      def call
        return if user.tgtg_active

        response = Faraday.put("#{ENV['TGTG_MICROSERVICE_URL']}/#{ENDPOINT}/#{user.id}")

        response.status == 200
      end
    end
  end
end