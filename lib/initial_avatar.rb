require 'initial_avatar/version'
require 'initial_avatar/avatar'
require 'initial_avatar/configuration'

module InitialAvatar
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def avatar_data_uri(name, options = {})
      Avatar.new(name, options).data_uri
    end
  end
end
