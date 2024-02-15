class AddDatestoChatRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_rooms, :day_end, :date
    add_column :chat_rooms, :day_start, :date
  end
end
