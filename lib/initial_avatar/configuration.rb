module InitialAvatar
  class Configuration
    OPTIONS = %i[text_color size font_weight font_family].freeze

    attr_accessor :colors
    attr_accessor :text_color
    attr_accessor :size
    attr_accessor :font_weight
    attr_accessor :font_family

    def initialize
      @colors = %w[
        #1abc9c #16a085 #f1c40f #f39c12 #2ecc71 #27ae60 #e67e22 #d35400 #3498db
        #2980b9 #e74c3c #c0392b #9b59b6 #8e44ad #bdc3c7 #34495e #2c3e50 #95a5a6
        #7f8c8d #ec87bf #d870ad #f69785 #9ba37e #b49255 #b49255 #a94136
      ]
      @text_color = '#ffffff'
      @size = 100
      @font_weight = 400
      @font_family = 'HelveticaNeue-Light,Helvetica Neue Light,Helvetica Neue,Helvetica, Arial,Lucida Grande, sans-serif'
    end

    def default_options
      OPTIONS.map { |key| [key, public_send(key)] }.to_h
    end
  end
end
