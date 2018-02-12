class CreateJokes < ActiveRecord::Migration[5.1]
  def change
    create_table :jokes do |t|
      t.string :quote
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
