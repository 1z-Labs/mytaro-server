class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :nickname
      t.string :phone
      t.boolean :isBeforePurchased, default: false
    end
  end
end
