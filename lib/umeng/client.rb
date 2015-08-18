require 'json'
require 'digest'
require 'umeng/services'

module Umeng
  UMENG_HOST = 'http://msg.umeng.com'
  
  class Client
    include Umeng::Services

    attr_accessor :appkey, :app_master_secret

    def initialize(appkey, app_master_secret)
      @appkey = appkey
      @app_master_secret = app_master_secret
    end
  end
end




