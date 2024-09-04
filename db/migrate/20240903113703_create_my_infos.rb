class CreateMyInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :my_infos, id: :string do |t|
      t.integer :gender
      t.date :birthday
      t.time :birthtime
      t.string :pName
      t.integer :pGender
      t.date :pBirthday
      t.time :pBirthtime
      t.string :user_id, null: false

      t.timestamps
    end

    # 외래 키 설정
    add_foreign_key :my_infos, :users, column: :user_id, primary_key: :id
  end
end
