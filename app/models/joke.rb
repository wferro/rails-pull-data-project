class Joke < ApplicationRecord
  belongs_to :source, :category
  has_one :reviews
  validates :quote, :answer, :question, presence: false
  validates :quote, length: { minimum: 20 }
  validates :question, length: { minimum: 20 }
  validates :answer, length: { minimum: 5 }
end
