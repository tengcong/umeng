require 'json'
require 'faraday'
require 'digest'
require 'umeng/send_message'

module Umeng
  UMENG_HOST = 'http://msg.umeng.com'
  
  class Client
    include Umeng::SendMessage

    attr_accessor :appkey, :app_master_secretm, :plantform

    def initialize(appkey, app_master_secret, plantform)
      @plantform = plantform
      @appkey = appkey
      @app_master_secret = app_master_secret
    end
  end
end