# Blacksmith

Blacksmith is a custom meme plugin for [robut](https://github.com/justinweiss/robut), a HipChat room plugin. It posts image according to the pattern in the room.

## Configure

In `Gemfile`:

```
gem 'blacksmith-hipchat'
```

In `Chatfile`:

```ruby
# Add the plugin to the list
Robut::Plugin.plugins << Blacksmith::Listener

# Select a room
Blacksmith::Config.room = "chatbot"

# Map the Images with Regexp
Blacksmith::Config.draw do
  # If you want someone to approve something
  map /approve/, to: 'http://i.imgur.com/4L8lDAl.png'

  # If you want to have faith
  map /(have|has|had) faith/, to: 'http://i.imgur.com/BGnagT3.png'

  # If you want to tell some one to do it
  map /do it/, to: 'http://i.imgur.com/4loCJ30.png'
end

# Optional: Add a title
Blacksmith::Config.title = "Memebot"
```
