class CreateContentChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :content_chapters do |t|
      t.string :id, primary_key: true, null: false
      t.integer :index, null: false
      t.text :chapters, null: false
      t.string :contentId, null: false

      t.foreign_key :contents, column: :contentId, primary_key: :id
    end
  end
end
