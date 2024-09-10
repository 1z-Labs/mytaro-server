class ChangeIdToAutoIncrementInCategories < ActiveRecord::Migration[7.0]
  def change
    # 기존 UUID 필드 삭제 (만약 이미 데이터가 있다면 이 단계는 조심스럽게 수행해야 함)
    remove_column :categories, :id, :string

    # 새로운 INT 타입의 auto_increment 필드 추가
    add_column :categories, :id, :primary_key
  end
end
