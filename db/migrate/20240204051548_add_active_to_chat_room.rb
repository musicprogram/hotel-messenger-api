class AddActiveToChatRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_rooms, :active, :boolean, default: false
  end
end
