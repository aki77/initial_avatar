require 'base64'

module InitialAvatar
  class Avatar
    attr_reader :text
    attr_reader :opts

    def initialize(text, options = {})
      @text = text.upcase
      @opts = InitialAvatar.configuration.default_options.merge(options)
    end

    def svg_tag
      <<~SVG
        <svg xmlns="http://www.w3.org/2000/svg" pointer-events="none" width="#{opts[:size]}" height="#{opts[:size]}" style="background-color: #{color};">
        <text text-anchor="middle" y="50%" x="50%" dy="0.35em" pointer-events="auto" fill="#{opts[:text_color]}" font-family="#{opts[:font_family]}" style="font-weight: #{opts[:font_weight]}; font-size: #{font_size}px;">#{text}</text>
        </svg>
      SVG
    end

    def data_uri
      "data:image/svg+xml;base64,#{Base64.strict_encode64(svg_tag)}"
    end

    private

    def color
      return opts[:color] if opts[:color]
      index = (text.ord + opts[:seed]) % InitialAvatar.configuration.colors.length
      InitialAvatar.configuration.colors[index]
    end

    def font_size
      opts[:font_size] || opts[:size] / 2
    end
  end
end
