require 'hipchat'

module BlackSmith
  class Hammer
    SERVER_URL = ENV["hipchat_server_url"]
    API_TOKEN = ENV["hipchat_api_token"]

    def initialize(target_room: "chatbot_fun", filename: nil)
      @hipchat = HipChat::Client.new(API_TOKEN, server_url: SERVER_URL)
      @target_room = target_room

      @equipment = BlackSmith::Equipment.get filename
    end

    def slam
      @hipchat[@target_room].send_file("?", "attached message", @equipment)
    end
  end
end
