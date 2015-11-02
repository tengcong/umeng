module Umeng
  module Util
    def generate_sign(uri, params)
      raise 'app master secret provided' unless @app_master_secret

      method = 'POST'
      url = [Umeng::UMENG_HOST, '/', uri]
      post_body = JSON.dump(params)
      Digest::MD5.hexdigest([method, url, post_body, @app_master_secret].join)
    end

    # {"status"=>6, "total_count"=>0, "accept_count"=>0, "sent_count"=>0, "open_count"=>0, "dismiss_count"=>0}
    def result(body, type)
      result = JSON.load(body)

      case type
      when 'api/send'
        body
      when 'api/status'
        body
      when 'api/cancel'
        body
      end
    end
  end
end
