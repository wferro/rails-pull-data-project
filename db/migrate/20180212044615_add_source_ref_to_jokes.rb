class AddSourceRefToJokes < ActiveRecord::Migration[5.1]
  def change
    add_reference :jokes, :source, foreign_key: true
  end
end
