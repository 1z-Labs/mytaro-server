class RemoveIdFromContentChapters < ActiveRecord::Migration[6.0]
  def change
    remove_column :content_chapters, :id, :string
  end
end
