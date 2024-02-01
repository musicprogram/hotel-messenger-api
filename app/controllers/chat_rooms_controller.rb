class ChatRoomsController < ApplicationController
  load_and_authorize_resource

  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages
    render json: @messages
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      render json: @chat_room
    else
      render json: {error: "cannot connection"}
    end
  end

  private

  def chat_room_params
    # Especifica los parámetros permitidos al crear un nuevo chat room
    params.require(:chat_room).permit(:name)
  end
end
