require 'hipchat'

module Blacksmith
  class Hammer
    def initialize(target_room: "chatbot_fun", url: nil)
      @target_room = target_room
      @url = url
    end

    def connection
      Blacksmith::Config.connection
    end

    def slam
      options = {
        message_format: "html",
      }

      connection[@target_room].send(
        Blacksmith::Config.title, 
        "<img src=\"#{@url}\" />", 
        options
      )
    end
  end
end
