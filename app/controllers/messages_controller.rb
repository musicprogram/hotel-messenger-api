class MessagesController < ApplicationController

  def index
    @userFront = params[:user].to_i
    @chat_room_id = params[:chat_room_id].to_i
    @messages = Message.where(chat_room_id: @chat_room_id)
    render json: @messages, status: :ok
  end

  def create

    return head :bad_request unless
      params[:content] &&
      params[:chat_room_id] &&
      params[:emisor]

    Message.create!(
      content: params[:content],
      chat_room_id: params[:chat_room_id],
      emisor: params[:emisor]
    )

    head :ok

  end

end
