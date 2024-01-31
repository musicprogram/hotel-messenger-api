class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def speak(data)
    ActionCable.server.broadcast('chat', message: data['message'])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
