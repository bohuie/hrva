class Admin::Sections::Questions::ResponsesController < ApplicationController
  
  def index
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @responses = @question.responses
  end

  def show
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.find params[:id]
  end

  def new
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.build
  end

  def edit
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.find params[:id]
  end

  def create
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.new params[:response] 

    if @response.save
      flash[:notice] = 'Response was successfully created.' 
      redirect_to admin_section_question_path( @section, @question )
    else
      render 'new'
    end
  end

  def update
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.find params[:id] 

    if @response.update_attributes(params[:response])
      flash[:notice] = 'Response was successfully updated.'
      redirect_to admin_section_question_path( @section, @question )
    else
      flash[:notice] = @response.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:question_id]
    @response  = @question.responses.find params[:id] 
    @response.destroy

    flash[:notice] = 'Response was successfully deleted.'
    redirect_to admin_section_question_path( @section, @question )
  end
end
