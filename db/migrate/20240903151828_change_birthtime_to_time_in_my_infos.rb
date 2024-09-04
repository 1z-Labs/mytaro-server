class ChangeBirthtimeToTimeInMyInfos < ActiveRecord::Migration[7.0]
  def change
    change_column :my_infos, :birthtime, :time
  end
end
