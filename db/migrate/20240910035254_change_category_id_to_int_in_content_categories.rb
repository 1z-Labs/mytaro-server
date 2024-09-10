class ChangeCategoryIdToIntInContentCategories < ActiveRecord::Migration[7.0]
  def change
    # 1. 만약 외래 키가 존재할 경우에만 제거 (안전하게 처리)
    if foreign_key_exists?(:content_categories, :categories)
      remove_foreign_key :content_categories, :categories
    end

    # 2. category_id 필드의 데이터 타입을 int로 변경
    change_column :content_categories, :category_id, :bigint

    # 3. 변경된 category_id에 외래 키 다시 추가
    add_foreign_key :content_categories, :categories, column: :category_id, primary_key: :id
  end
end
