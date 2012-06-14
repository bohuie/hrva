class User::Questionnaires::AnswersController < ApplicationController

  # continues assessment to next unanswered question
  def new 
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @question      = @questionnaire.next
    @answer        = @questionnaire.answers.build :question=>@question
  end

  def create
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @answer        = @questionnaire.answers.new params[:answer]
    @question      = @answer.question

    if @answer.save
      redirect_to new_user_questionnaire_answer_path
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
  end
end
