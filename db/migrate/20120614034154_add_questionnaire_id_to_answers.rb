class AddQuestionnaireIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :questionnaire_id, :integer
    add_index  :answers, :questionnaire_id
  end
end
