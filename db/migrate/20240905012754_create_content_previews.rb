class CreateContentPreviews < ActiveRecord::Migration[7.0]
  def change
    create_table :content_previews do |t|
      t.string :imagePath, null: false
      t.string :contentId, null: false

      t.foreign_key :contents, column: :contentId, primary_key: :id
    end
  end
end
