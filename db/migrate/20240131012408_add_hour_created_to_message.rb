class AddHourCreatedToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :hourCreated, :string
  end
end
