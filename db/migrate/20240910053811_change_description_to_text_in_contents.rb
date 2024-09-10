class ChangeDescriptionToTextInContents < ActiveRecord::Migration[6.0]
  def change
    change_column :contents, :description, :text
  end
end
