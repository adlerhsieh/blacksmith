require 'robut'

module Blacksmith
  class Listener
    include Robut::Plugin

    def handle(time, sender, message)
      Config.patterns.each do |pattern, filename|
        if message[pattern]
          Hammer.new(target_room: "chatbot_fun_lab", filename: filename).slam
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
