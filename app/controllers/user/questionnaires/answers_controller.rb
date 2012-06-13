class AnswersController 

  # continues assessment to next unanswered question
  def new 
    @answer = Answer.new 
  end

end
