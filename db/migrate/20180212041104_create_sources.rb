class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :source
      t.string :description

      t.timestamps
    end
  end
end
