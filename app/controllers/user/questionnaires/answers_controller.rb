class User::Questionnaires::AnswersController < ApplicationController

  before_filter :authenticate_user!

  def new 
    @questionnaire       = Questionnaire.find params[:questionnaire_id]
    if @questionnaire.complete?
      redirect_to thankyou_path
    else
      @question, @previous = @questionnaire.next
      @answer              = @questionnaire.build_answer @question
    end
  end

  def create
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @answer        = @questionnaire.answers.new params[:answer]
    @question      = @answer.question

    if @answer.save
      if params[:save_and_exit] == 'true'
        redirect_to returnsoon_path
      else
        if @answer.next
          redirect_to edit_user_questionnaire_answer_path( @questionnaire, @answer.next )
        else
          redirect_to new_user_questionnaire_answer_path
        end
      end
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @answer        = @questionnaire.answers.find params[:id]
    @answer.build_multianswers_if_none
    @question      = @answer.question
    @previous      = @answer.prev #@questionnaire.prev( @answer )
  end

  def update
    @questionnaire = Questionnaire.find params[:questionnaire_id]
    @answer        = @questionnaire.answers.find params[:id]
    @question      = @answer.question

    if @answer.update_attributes( params[:answer] )
      if params[:save_and_exit] == 'true'
        redirect_to returnsoon_path
      elsif @answer.next
        redirect_to edit_user_questionnaire_answer_path(@questionnaire, @answer.next)
      else
        redirect_to new_user_questionnaire_answer_path
      end
    else
      flash[:error] = @answer.errors.full_messages.to_sentence
      render 'edit'
    end
  end
end
