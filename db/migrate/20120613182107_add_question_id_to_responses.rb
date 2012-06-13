class AddQuestionIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :question_id, :integer
    add_index  :responses, :question_id
  end
end
