require 'hipchat'

module Blacksmith
  class Hammer
    def initialize(target_room: "chatbot_fun", filename: nil)
      @target_room = target_room
      @resource = Blacksmith::Resource.get(filename)
    end

    def connection
      Blacksmith::Config.connection
    end

    def slam
      connection[@target_room].send_file("Memebot", "", @resource)
    end
  end
end
