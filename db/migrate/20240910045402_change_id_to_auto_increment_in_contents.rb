class ChangeIdToAutoIncrementInContents < ActiveRecord::Migration[7.0]
  def change
    # 외래 키 제거
    if foreign_key_exists?(:reviews, :contents, column: :contentId)
      remove_foreign_key :reviews, :contents, column: :contentId
    end
    if foreign_key_exists?(:content_previews, :contents, column: :contentId)
      remove_foreign_key :content_previews, :contents, column: :contentId
    end
    if foreign_key_exists?(:content_chapters, :contents, column: :contentId)
      remove_foreign_key :content_chapters, :contents, column: :contentId
    end
    if foreign_key_exists?(:content_categories, :contents, column: :content_id)  # 수정된 부분
      remove_foreign_key :content_categories, :contents, column: :content_id
    end

    # 기존 데이터 삭제
    execute 'DELETE FROM reviews'
    execute 'DELETE FROM content_previews'
    execute 'DELETE FROM content_chapters'
    execute 'DELETE FROM content_categories'

    # contentId 필드의 타입을 bigint로 변경
    change_column :reviews, :contentId, :bigint
    change_column :content_previews, :contentId, :bigint
    change_column :content_chapters, :contentId, :bigint
    change_column :content_categories, :content_id, :bigint  # 수정된 부분

    # contents 테이블에서 기존 id를 bigint auto_increment로 변경
    remove_column :contents, :id
    add_column :contents, :id, :bigint, auto_increment: true, primary_key: true

    # 외래 키 다시 추가
    add_foreign_key :reviews, :contents, column: :contentId
    add_foreign_key :content_previews, :contents, column: :contentId
    add_foreign_key :content_chapters, :contents, column: :contentId
    add_foreign_key :content_categories, :contents, column: :content_id  # 수정된 부분
  end
end
