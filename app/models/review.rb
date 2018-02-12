class Review < ApplicationRecord
  belongs_to :joke
  belongs_to :user
  validates :score, presence: true
  validates :score, numericality: { only_integer: true }
  validates :score, numericality:{ greater_than: 0 }
  validates :score, numericality:{ less_than_or_equal_to: 10 }
end
