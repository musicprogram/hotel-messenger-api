class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      redirect_to @chat_room, notice: 'Chat room was successfully created.'
    else
      render :new
    end
  end

  private

  def chat_room_params
    # Especifica los parámetros permitidos al crear un nuevo chat room
    params.require(:chat_room).permit(:name)
  end
end
