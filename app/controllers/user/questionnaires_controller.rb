class User::QuestionnairesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @questionnaire = current_user.questionnaires.last || current_user.questionnaires.build
    if @questionnaire.save
        redirect_to new_user_questionnaire_answer_path( @questionnaire )
      else
        render 'new'
    end
  end

end
