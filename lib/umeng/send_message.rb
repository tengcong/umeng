require 'umeng/services'
require 'umeng/json_body'

module Umeng
  module SendMessage
    include Umeng::Services
    include Umeng::JsonBody

    # 广播
    def push_broadcast(content, opt={})
      params = {
        type: 'broadcast',
        description: opt['description'] || '广播',
        production_mode: opt['production_mode'] || 'false'
      }
      case @plantform
      when 'android'
        params.merge! android_params(content, opt)
        push(params)
      when 'ios'
        params.merge! ios_params(content, opt)
        push(params)
      end
    end

    # 单播
    def push_unicast(device_tokens, content, opt={})
      params = {
        device_tokens: device_tokens,
        type: 'unicast',
        description: opt['description'] || '单播',
        production_mode: opt['production_mode'] || 'false',
      }
      case @plantform
      when 'android'
        params.merge! android_params(content, opt)
        push(params)
      when 'ios'
        params.merge! ios_params(content, opt)
        push(params)
      end
    end

    # 列播
    def push_listcast(device_tokens, content, opt={})
      params = {
        device_tokens: device_tokens,
        type: 'listcast',
        description: opt['description'] || '列播',
        production_mode: opt['production_mode'] || 'false',
      }
      case @plantform
      when 'android'
        params.merge! android_params(content, opt)
        push(params)
      when 'ios'
        params.merge! ios_params(content, opt)
        push(params)
      end
    end

  end
end