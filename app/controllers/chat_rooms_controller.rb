class ChatRoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_chat_room, only: [:update]


  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end

  def show
    @chat_room = ChatRoom.find(params[:id])

    render json: @chat_room
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      @chat_room.update(user_creator: current_user.id)
      render json: @chat_room
    else
      render json: { errors: @chat_room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_active
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.update(active: params[:active])
    render json: @chat_room
  end

  def update
    if @chat_room.update(chat_room_params)
      render json: @chat_room, status: :ok
    else
      render json: { error: @chat_room.errors.full_messages }, status: :unprocessable_entity
    end
  end



  def access_links

    room = ChatRoom.find(1)
    day_end = room.day_end
    day_start = room.day_start
    # services fecha_x_str,start_day,end_day

    date = {
      start: VerifyDatesService.new(day_start, false, false).time_diference,
      end: VerifyDatesService.new(day_end, false, false).time_diference
    }

    chat_working = VerifyDatesService.new(false, date[:start][:diference_time], date[:end][:diference_time]).is_working_chat

    data = {
      chat_working: chat_working,
      date: date,
      chat_room: room
    }

    render json: data
  end



  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end


  def chat_room_params
    # Especifica los parámetros permitidos al crear un nuevo chat room
    params.require(:chat_room).permit(:name, :active, :day_end,:day_start, :hour, :user_creator, :access_link)
  end
end
