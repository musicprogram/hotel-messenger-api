class AddHourToChatRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_rooms, :hour, :string
  end
end
