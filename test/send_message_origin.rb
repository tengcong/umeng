require 'json'
require 'digest'
require 'net/http'
require 'faraday'

method = 'POST'
appkey = 'xxxxxxxxx'
app_master_secret = 'bbbbbbbbbbb'
timestamp = Time.now.to_i
url = 'http://msg.umeng.com/api/send'

ios_params = {
  'appkey': appkey,
  'timestamp': timestamp,
  'type': 'broadcast',
  'payload': {
    'aps': {
      'alert': 'Hello World',
      'content-available': '3456789456789'
    },
    'key1': '1234567891234567890'
  },
  'production_mode': 'false',
  'description': 'OKOKOK?'
}

p dddd = JSON.dump(ios_params)
puts stringss = [method, url, dddd, app_master_secret].join
sign = Digest::MD5.hexdigest([method, url, dddd, app_master_secret].join)
puts sign
conn = Faraday.new(:url => 'http://msg.umeng.com') do |faraday|
  faraday.request  :url_encoded
  faraday.response :logger
  faraday.adapter  Faraday.default_adapter
end

response = conn.post do |req|
  req.url '/api/send', sign: sign
  req.headers['Content-Type'] = 'application/json'
  req.body = ios_params.to_json
end

puts "111"
puts response.body
puts "2222"