module Blacksmith
  class Config
    class << self
      def draw(&block)
        class_eval(&block)
      end

      def map(pattern = nil, options = {})
        raise MappingError, "No pattern is given" if pattern.nil?
        raise MappingError, "Pattern cannot be blank" if pattern == //
        raise MappingError, "Pattern should be a Regexp" unless pattern.is_a? Regexp
        raise MappingError, "Missing target in mapping. Use: to: 'target'"  if options.is_a?(Hash).! || options[:to].nil?
        patterns[pattern] = options[:to]
      end

      def patterns
        @patterns ||= {}
      end
    end
  end

  class MappingError < StandardError; end
end
