class AddIndexesToBadPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    add_index :bad_phone_numbers, :phone_number
  end
end
