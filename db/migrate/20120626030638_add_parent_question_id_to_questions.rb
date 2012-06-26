class AddParentQuestionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :parent_question_id, :integer
    add_index  :questions, :parent_question_id

    add_column :questions, :parent_response_value, :integer
    add_index  :questions, :parent_response_value
  end
end
