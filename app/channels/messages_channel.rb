class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:chat_room_id]}"
  end


  def unsubscribed
    stop_all_streams
  end
end
