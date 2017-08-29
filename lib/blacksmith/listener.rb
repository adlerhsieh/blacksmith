require 'robut'

module Blacksmith
  class Listener
    include Robut::Plugin

    def handle(time, sender, message)
      # h = Hammer.new(target_room: "chatbot_fun_lab", filename: "greg-approves")
      # h.slam
    end
  end
end
