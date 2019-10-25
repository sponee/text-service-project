class AddMessageIdToTextMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :text_messages, :message_id, :text
  end
end
