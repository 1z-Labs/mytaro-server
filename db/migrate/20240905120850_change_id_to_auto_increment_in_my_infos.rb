class ChangeIdToAutoIncrementInMyInfos < ActiveRecord::Migration[7.0]
  def change
    remove_column :my_infos, :id, :uuid
    add_column :my_infos, :id, :integer, auto_increment: true, null: false, primary_key: true
  end
end
