class CreateMyInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :my_infos do |t|
      t.string :name
      t.integer :gender
      t.date :birthday
      t.time :birthtime
      t.string :pName
      t.integer :pGender
      t.date :pBirthday
      t.time :pBirthtime
      t.string :user_id, default: -> {'UUID()'},null: false

      t.timestamps
    end
  end
end
