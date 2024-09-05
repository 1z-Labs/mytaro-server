class ContentChapter < ApplicationRecord
  belongs_to :content, foreign_key: 'contentId'
  before_create :generate_uuid

  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
