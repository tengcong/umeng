require 'json'
require 'faraday'
require 'digest'
require 'umeng/send_message'

module Umeng
  UMENG_HOST = 'http://msg.umeng.com'

  class Client
    include Umeng::SendMessage

    class << self
      def config
        @instance = self.new
        yield @instance
      end

      def instance
        @instance
      end
    end

    attr_accessor :appkey, :app_master_secretm
  end
end
