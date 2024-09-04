class User < ApplicationRecord
  before_create :generate_uuid

  has_many :my_infos, primary_key: :id, foreign_key: :user_id

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
