class RenameUserIdToUserIdInMyInfos < ActiveRecord::Migration[7.0]
  def change
    rename_column :my_infos, :userId, :user_id
  end
end
