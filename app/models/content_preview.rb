class ContentPreview < ApplicationRecord
  belongs_to :content, foreign_key: 'contentId'
end
