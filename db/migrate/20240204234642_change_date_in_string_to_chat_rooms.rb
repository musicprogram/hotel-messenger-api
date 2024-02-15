class ChangeDateInStringToChatRooms < ActiveRecord::Migration[7.0]
  def up
    change_column :chat_rooms, :day_start, :string
    change_column :chat_rooms, :day_end, :string
  end
end
