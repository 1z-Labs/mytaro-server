class Review < ApplicationRecord
  belongs_to :content, foreign_key: 'contentId'
  belongs_to :user, foreign_key: 'authorId'

  before_create :generate_uuid
  before_save :set_author_name

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end

  def set_author_name
    self.author = user.nickname if user
  end
end
