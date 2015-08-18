require 'umeng/util'

module Umeng
  module Services
    include Umeng::Util

    # 消息发送
    # POST http://msg.umeng.com/api/send?sign=mysign
    def push(params={})
      uri = 'api/send'
      params.merge!({
        appkey: @appkey,
        timestamp: Time.now.to_i
      })
      request(uri, params)
    end

    # 查看状态
    # POST http://msg.umeng.com/api/status?sign=mysign
    def status(task_id)
      uri = 'api/status'
      params = {
        appkey: @appkey,
        timestamp: Time.now.to_i,
        task_id: task_id
      }
      request(uri, params)
    end

    #取消任务
    #POST http://msg.umeng.com/api/cancel?sign=mysign
    def cancel(task_id)
      uri = 'api/cancel'
      params = {
          appkey: @appkey,
          timestamp: Time.now.to_i,
          task_id: task_id
      }
      request(uri, params)
    end

    private
      def request(uri, params)
        conn = Faraday.new(:url => Umeng::UMENG_HOST) do |faraday|
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end

        response = conn.post do |req|
          req.url uri, sign: generate_sign(uri, params)
          req.headers['Content-Type'] = 'application/json'
          req.body = params.to_json
        end

        result(response.body, uri)
      end
  end
end
