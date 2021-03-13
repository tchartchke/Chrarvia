class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :round_id
      t.integer :order
      t.string :question

      t.timestamps
    end
  end
end
