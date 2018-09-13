# Initial Avatar

Create Gmail like text avatars.

![](https://cldup.com/IbyArDI6fV.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'initial_avatar'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install initial_avatar
```

## Usage

CarrierWave example:

```ruby
class ProfileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    InitialAvatar.avatar_data_uri(model.name[0], size: 100, font_size: 70)
  end

  version :thumb do
    process resize_to_fill: [100, 100]
  end
end
```

## Configuration

In `config/initializers/initial_avatar.rb`, you can configure the following values.

```ruby
InitialAvatar.configure do |config|
#   config.colors = %w[
#     #1abc9c #16a085 #f1c40f #f39c12 #2ecc71 #27ae60 #e67e22 #d35400 #3498db
#     #2980b9 #e74c3c #c0392b #9b59b6 #8e44ad #bdc3c7 #34495e #2c3e50 #95a5a6
#     #7f8c8d #ec87bf #d870ad #f69785 #9ba37e #b49255 #b49255 #a94136
#   ]
#   config.text_color = '#ffffff'
#   config.size = 100
#   config.font_weight = 400
#   config.font_family = 'HelveticaNeue-Light,Helvetica Neue Light,Helvetica Neue,Helvetica, Arial,Lucida Grande, sans-serif'
#   config.seed = 0
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aki77/initial_avatar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
