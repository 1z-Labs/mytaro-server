class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :review
      t.string :author

      t.string :contentId
      t.string :authorId

      t.foreign_key :contents, column: :contentId, primary_key: :id
      t.foreign_key :users, column: :authorId, primary_key: :id

      t.timestamps
    end
  end
end
