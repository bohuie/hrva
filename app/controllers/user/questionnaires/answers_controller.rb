class User::Questionnaires::AnswersController < ApplicationController

  # continues assessment to next unanswered question
  def new 
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @question = @questionnaire.next
    @answer   = @questionnaire.answers.build :question=>@question
  end

end
