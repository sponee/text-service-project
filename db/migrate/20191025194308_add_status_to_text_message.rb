class AddStatusToTextMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :text_messages, :status, :text
    add_index :text_messages, :status
  end
end
