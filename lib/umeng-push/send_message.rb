require 'umeng-push/services'
require 'umeng-push/json_body'

module UmengPush
  module SendMessage
    include UmengPush::Services
    include UmengPush::JsonBody

    # 广播
    def push_broadcast(opts={})
      params = {
        type: 'broadcast',
        production_mode: @production_mode
      }
      params.merge! ios_params(opts)
      push(params)
    end

    # 单播
    def push_unicast(device_tokens, opts={})
      params = {
        device_tokens: device_tokens,
        type: 'unicast',
        production_mode: @production_mode
      }
      params.merge! ios_params(opts)
      push(params)
    end

    # 列播
    def push_listcast(device_tokens, opts={})
      params = {
        device_tokens: device_tokens,
        type: 'listcast',
        production_mode: @production_mode
      }


      # # to Android
      # params.merge! android_params(opts)
      # push(params)
      params.merge! ios_params(opts)
      push(params)
    end
  end
end
