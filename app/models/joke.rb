class Joke < ApplicationRecord
  belongs_to :source
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :quote, :answer, :question, presence: false
  validates :quote, length: { minimum: 20 }
  validates :question, length: { minimum: 20 }
  validates :answer, length: { minimum: 5 }
end
