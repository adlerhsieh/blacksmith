module Blacksmith
  class Config
    class << self

      attr_accessor :title, :room, :patterns, :server_url, :api_token

      def connection
        return @client if @client

        ["room", "api_token"].each do |attr|
          if eval(attr).nil?
            raise ConfigError, "Missing configuration: #{attr}. Check README to setup." 
          end
        end

        @client = if server_url
                    HipChat::Client.new(api_token, server_url: server_url)
                  else
                    HipChat::Client.new(api_token)
                  end
      end

      def establish_connection!
        connection
      end

      def draw(&block)
        class_eval(&block)
      end

      def map(pattern = nil, options = {})
        self.patterns ||= {}

        raise MappingError, "Pattern can only be a Regexp" unless pattern.is_a? Regexp
        raise MappingError, "Pattern cannot be blank" if pattern == //
        raise MappingError, "Missing target in mapping. Use: to: 'image_url'"  if options.is_a?(Hash).! || options[:to].nil?

        self.patterns[pattern] = options[:to]
      end
    end
  end

  class ConfigError < StandardError; end
  class MappingError < StandardError; end
end
