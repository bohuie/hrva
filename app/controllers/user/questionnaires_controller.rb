class QuestionnairesController 

  def create
    @questionnaire = Questionnaire.new params[:questionnaire] 
    if @questionnaire.save
        redirect_to new_user_questionnaire_answer_path
      else
        render 'new'
    end
  end

end
