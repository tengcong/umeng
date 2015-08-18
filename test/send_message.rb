u = Umeng::Client.new('aaaaaaaaa', 'bbbbbbbbbbb')

params = {
  'type': 'broadcast',
  'payload': {
    'aps': {
      'alert': 'Hello World',
      'content-available': '3456789456789'
    },
    'key1': '1234567891234567890'
  },
  'production_mode': 'false',
  'description': '流云？'
}

u.send_message(params)