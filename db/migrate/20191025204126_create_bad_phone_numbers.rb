class CreateBadPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :bad_phone_numbers do |t|
      t.string :phone_number
    end
  end
end
