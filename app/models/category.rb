class Category < ApplicationRecord
  has_many :content_categories
  has_many :contents, through: :content_categories
end
