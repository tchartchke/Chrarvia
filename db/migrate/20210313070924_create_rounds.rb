class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.integer :quiz_id
      t.integer :order
      t.string :subject

      t.timestamps
    end
  end
end
