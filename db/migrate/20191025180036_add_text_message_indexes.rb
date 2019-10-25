class AddTextMessageIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :text_messages, :phone_number
    add_index :text_messages, :message
    add_index :text_messages, [:phone_number, :message]
  end
end
