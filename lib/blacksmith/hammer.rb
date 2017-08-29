require 'hipchat'

module Blacksmith
  class Hammer
    SERVER_URL = ENV["HIPCHAT_SERVER_URL"]
    API_TOKEN = ENV["HIPCHAT_API_TOKEN"]

    def initialize(target_room: "chatbot_fun", filename: nil)
      @hipchat = HipChat::Client.new(API_TOKEN, server_url: SERVER_URL)
      @target_room = target_room

      @resource = Blacksmith::Resource.get(filename)
    end

    def slam
      @hipchat[@target_room].send_file("?", "attached message", @resource)
    end
  end
end
