require 'umeng/services'
require 'umeng/json_body'

module Umeng
  module SendMessage
    include Umeng::Services
    include Umeng::JsonBody

    # 广播
    def push_broadcast(opts={})
      params = {
        type: 'broadcast',
        description: opts['description'] || '广播',
        production_mode: opts['production_mode'] || 'false'
      }
      case @plantform
      when 'Android'
        params.merge! android_params(content, opts)
        push(params)
      when 'iOS'
        params.merge! ios_params(content, opts)
        push(params)
      end
    end

    # 单播
    def push_unicast(device_tokens, opts={})
      params = {
        device_tokens: device_tokens,
        type: 'unicast',
        description: opts[:description] || '单播',
        production_mode: opts[:production_mode] || 'false',
      }
      case @plantform
      when 'Android'
        params.merge! android_params(opts)
        push(params)
      when 'iOS'
        params.merge! ios_params(opts)
        push(params)
      end
    end

    # 列播
    def push_listcast(device_tokens, opts={})
      params = {
        device_tokens: device_tokens,join(','),
        type: 'listcast',
        description: opts[:description],
        production_mode: opts[:production_mode],
      }
      case @plantform
      when 'Android'
        params.merge! android_params(opts)
        push(params)
      when 'iOS'
        params.merge! ios_params(opts)
        push(params)
      end
    end

  end
end