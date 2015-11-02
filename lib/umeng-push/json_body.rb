module UmengPush
  module JsonBody
    def android_params(opts={})
      {
        payload: {
          display_type: 'message',
          body: {
            custom: opts[:key_value]
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
        }.merge(opts[:key_value]),
        description: opts[:description]
      }
    end
  end
end
