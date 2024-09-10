class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :integer, primary_key: :id, auto_increment: true do |t|
      t.string :name
      t.string :icon
    end
  end
end
