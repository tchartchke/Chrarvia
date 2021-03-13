class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :answer
      t.integer :score

      t.timestamps
    end
  end
end
