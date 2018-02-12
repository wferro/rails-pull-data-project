class Category < ApplicationRecord
  has_many :jokes
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
end
