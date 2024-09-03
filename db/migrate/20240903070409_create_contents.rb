class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :title, null: false
      t.string :subtitle
      t.string :description
      t.string :imagePath, null: false
      t.string :content, null: false
      t.integer :clover, null: false
    end
  end
end
