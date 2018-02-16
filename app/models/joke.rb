#Joke table
class Joke < ApplicationRecord
  belongs_to :source
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :quote, :answer, :question, presence: false
  validates :quote, length: { maximum: 200 }
  validates :question, length: { maximum: 200 }
  validates :answer, length: { maximum: 200 }
end
