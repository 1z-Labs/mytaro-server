class MyInfo < ApplicationRecord
  belongs_to :user, primary_key: :id, foreign_key: :user_id

  #user_id가 반드시 존재해야 한다는 유효성 검사
  validates :user_id, presence: true

  private


end