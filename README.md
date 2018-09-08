# Initial Avatar

Create Gmail like text avatars.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'initial_avatar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install initial_avatar

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aki77/initial_avatar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
