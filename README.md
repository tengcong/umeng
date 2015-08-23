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
创建 umeng = Umeng::Client.new(appkey, app_master_secret, plantform)

广播 umeng.push_broadcast(opts={})

单播 umeng.push_unicast(device_tokens, opts={})

列播 umeng.push_listcast(device_tokens, opts={})

状态 umeng.status(task_id)

取消 umeng.cancel(task_id)
```

## Console

```
queue = {plantform_type: 'iOS', data: {title: 'title',content: 'content',information_id: 'information_id',paragraph_id: 'paragraph_id',notification_type: 'information',information_type: 'editor_chosen'}}
abs = {
  production_mode: queue_hash[:queue_hash],
  display_type: queue_hash[:display_type],
  content: queue_hash[:data][:content],
  key_value: queue_hash[:data]
}
```

```
# ios
u_ios = Umeng::Client.new(appkey, app_master_secret, 'iOS')
u_ios.push_broadcast('我是广播')
u_ios.push_unicast('f61d2fd0348cb72c139c09989e4215fd4c4fd03dc00c10eb773ece2cf534327e', '我是单播', abs)
u_ios.push_listcast('f61d2fd0348cb72c139c09989e4215fd4c4fd03dc00c10eb773ece2cf534327e,f2379719519737c14759568b05eda1efd8cabd7131523777afb9a8d67a690cbf', abs)

# android
u_android = Umeng::Client.new(appkey, app_master_secret, 'Android')
u_android.push_broadcast('我是广播')
u_android.push_unicast('AgQZuXku_eGXcgHOrAiUxOIkUlivC3QcE2-hf0YtvQ9R', '我是单播')
u_android.push_listcast('AgQZuXku_eGXcgHOrAiUxOIkUlivC3QcE2-hf0YtvQ9R,AgQZuXku_eGXcgHOrAiUxOIkUlivC3QcE2-hf0YtvQ9X', '我是列播')
```
