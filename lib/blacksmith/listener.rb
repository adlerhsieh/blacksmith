require 'robut'

module Blacksmith
  class Listener
    include Robut::Plugin

    def handle(time, sender, message)
      # Don't handle messages sent from this plugin
      return if message.include?("File uploaded")

      Config.patterns.each do |pattern, url|
        if message[pattern]
          Hammer.new(url: url).slam
          break
        end
      end
    rescue => err
      puts "#{err.class}: #{err.message}"
      err.backtrace.each do |b|
        puts b
      end
    end
  end
end
