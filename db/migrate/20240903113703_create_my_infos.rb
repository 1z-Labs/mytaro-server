class CreateMyInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :my_infos, id: :string do |t|
      t.integer :gender
      t.date :birthday, null:false
      t.time :birthtime, null: false
      t.string :pName
      t.integer :pGender
      t.date :pBirthday, null:false
      t.time :pBirthtime, null:false
      t.string :user_id, null: false

      t.timestamps
    end

    add_foreign_key :my_infos, :users, column: :user_id, primary_key: :id
  end
end
