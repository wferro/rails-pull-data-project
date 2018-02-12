class Review < ApplicationRecord
  belongs_to :joke
  validates :score, presence: true
  validates :score { only_integer: true }
  validates :score { greater_than: 0 }
  validates :score { less_than_or_equal_to: 10 } 
end
