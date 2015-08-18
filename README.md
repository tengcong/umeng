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
umeng.status(params)
```

## Development

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

