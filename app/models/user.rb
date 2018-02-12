class User < ApplicationRecord
  has_many :reviews
  has_many :jokes, through: :reviews
  validates :name, presence: true
  validates :email, uniqueness: true
end
