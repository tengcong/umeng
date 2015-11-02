require 'json'
require 'faraday'
require 'digest'
require 'umeng-push/send_message'

module UmengPush
  UMENG_HOST = 'http://msg.umeng.com'

  class Client
    include UmengPush::SendMessage

    class << self
      def config
        @instance = self.new
        yield @instance
      end

      def instance
        @instance
      end
    end

    attr_accessor :appkey, :app_master_secret
  end
end
