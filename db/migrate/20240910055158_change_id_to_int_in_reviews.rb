class ChangeIdToIntInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :id, :bigint, auto_increment: true
  end
end
