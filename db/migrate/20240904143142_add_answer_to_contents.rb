class AddAnswerToContents < ActiveRecord::Migration[7.0]
  def change
    add_column :my_infos, :answer, :string
  end
end
