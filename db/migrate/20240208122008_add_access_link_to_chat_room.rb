class AddAccessLinkToChatRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_rooms, :access_link, :string
  end
end
