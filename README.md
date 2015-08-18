# Umeng

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/umeng`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'umeng'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install umeng

## Usage
```
ument = Umeng::Client.new(appkey, app_master_secret)
umeng.send_message(params)
umeng.status(task_id)
umeng.cancel(task_id)
```

## Params
```
android
params = {
  'type': 'broadcast',
  'payload': {
    'display_type': 'notification',
    'body': {
      'ticker': '通知栏提示文字',
      'title': '标题',
      'text': '文字描述',
      'after_open': 'go_app'
    },
    'key1': '1234567891234567890'
  },
  'production_mode': 'false',
  'description': '消息描述'
}
```

```
ios
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
```

