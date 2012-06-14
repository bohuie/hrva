class AddQuestionIdToAnswers < ActiveRecord::Migration
  def change
    add_index  :answers, :question_id
    add_index  :answers, :response_id
  end
end
