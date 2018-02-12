class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
