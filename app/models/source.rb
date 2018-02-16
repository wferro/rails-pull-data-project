#Source table
class Source < ApplicationRecord
  has_many :jokes
  validates :description, :source, presence: true
  validates :description, length: { minimum: 10 }
end
