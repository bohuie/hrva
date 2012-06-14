class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :response_id
      t.text :response_text

      t.timestamps
    end
  end
end
