class RemoveTimestampsFromContentCategories < ActiveRecord::Migration[7.0]
  def change
    # 타임스탬프 필드 제거
    remove_column :content_categories, :created_at, :datetime
    remove_column :content_categories, :updated_at, :datetime
  end
end
