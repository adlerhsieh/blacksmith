# Blacksmith

Blacksmith is a custom meme plugin for [robut](https://github.com/justinweiss/robut), a HipChat room plugin. It posts image according to the pattern in the room.

## Configure

In `Gemfile`:

```
gem 'blacksmith-hipchat'
```

In `Chatfile`:

```ruby
# Required variables
ENV["HIPCHAT_SERVER_URL"] = "..."
ENV["HIPCHAT_API_TOKEN"] = "..."

# Add the plugin to the list
Robut::Plugin.plugins << Blacksmith::Listener

# Select a room
Blacksmith::Config.room = "chatbot"

# Map the Images with Regexp
Blacksmith::Config.draw do
  # map /regexp/, to: 'image_url'
  map /rails/, to: 'https://i.imgur.com/SAfUrEV.jpg'
end

# Optional: Add a title to the message sender
Blacksmith::Config.title = "Memebot"
```