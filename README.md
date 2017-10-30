# Blacksmith

Blacksmith is a custom meme plugin for [robut](https://github.com/justinweiss/robut), a HipChat room plugin. It posts image according to the pattern in the room.

## Configure

In `Gemfile`:

```
gem 'blacksmith-hipchat'
```

run `bundle install` afterwards.

In `Chatfile`:

```ruby
# Add the plugin to the list
Robut::Plugin.plugins << Blacksmith::Listener

# Select a room
Blacksmith::Config.room = "chatbot"

# custom server_url
Blacksmith::Config.server_url = "https://custom_server.com"

# API token for the account sending all messages
# See how to generate a personal token at https://www.hipchat.com/docs/apiv2/method/generate_token
Blacksmith::Config.api_token = "..."

# Map the Images with Regexp
Blacksmith::Config.draw do
  # map /regexp/, to: 'image_url'
  map /just do it/, to: 'https://i.imgur.com/4loCJ30.png'
end
```

Optional setup:

```ruby
# Add a title to the message sender
Blacksmith::Config.title = "Memebot"
```
