module Umeng
  module JsonBody
    def android_params(content, opt={})
      display_type = opt[:display_type] || "message"
      {
        'payload': {
          'display_type': display_type,
          'body': {
            'custom': content
          }
        }
      }
    end

    def ios_params(content, opt={})
      {
        'payload': {
          'aps': {
            'alert': content
          }
        }.merge(opt[:kv])
      }
    end
  end
end
