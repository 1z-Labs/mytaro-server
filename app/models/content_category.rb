class ContentCategory < ApplicationRecord
  belongs_to :content, foreign_key: :content_id
  belongs_to :category, foreign_key: :category_id
end
