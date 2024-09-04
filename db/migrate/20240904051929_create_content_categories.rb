class CreateContentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :content_categories do |t|
      t.string :content_id, null: false
      t.string :category_id, null: false
    end

    add_foreign_key :content_categories, :contents, column: :content_id, primary_key: :id
    add_foreign_key :content_categories, :categories, column: :category_id, primary_key: :id
  end
end
