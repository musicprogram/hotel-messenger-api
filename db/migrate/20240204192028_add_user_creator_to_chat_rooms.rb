class AddUserCreatorToChatRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_rooms, :user_creator, :integer
  end
end
