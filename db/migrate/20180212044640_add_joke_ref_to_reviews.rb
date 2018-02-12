class AddJokeRefToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :joke, foreign_key: true
  end
end
