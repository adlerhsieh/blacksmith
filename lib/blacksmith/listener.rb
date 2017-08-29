require 'robut'

module Blacksmith
  class Listener
    include Robut::Plugin

    def handle(time, sender, message)
      return if message.include?("File uploaded")
      Config.patterns.each do |pattern, url|
        if message[pattern]
          Hammer.new(target_room: "chatbot_fun", url: url).slam
          return
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
