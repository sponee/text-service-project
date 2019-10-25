class CreateTextMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :text_messages do |t|
      t.text :phone_number
      t.text :message
    end
  end
end
