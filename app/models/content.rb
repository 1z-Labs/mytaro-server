class Content < ApplicationRecord
  before_create :generate_uuid
  has_many :reviews, foreign_key: 'contentId'

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
