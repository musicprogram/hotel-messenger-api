class AddEmisorToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :emisor, :integer
  end
end
