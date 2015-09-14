module Umeng
  module JsonBody
    def android_params(opts={})
      display_type = opts[:display_type] || 'notification'
      {
        payload: {
          display_type: display_type,
          body: {
            custom: opts[:content]
          }
        }
      }
    end

    def ios_params(opts={})
      {
        payload: {
          aps: {
            alert: opts[:content]
          }
        }.merge(opts[:key_value])
      }
    end
  end
end

# 55f641d5695a3231e6d70400