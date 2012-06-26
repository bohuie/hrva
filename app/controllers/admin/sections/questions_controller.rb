class Admin::Sections::QuestionsController < ApplicationController
  
  def index
    @section   = Section.find params[:section_id]
    @questions = @section.questions
  end

  def show
    @section   = Section.find params[:section_id]
    @question  = @section.questions.find params[:id] 
    @responses = @question.responses.all( :order=>'value' )
  end

  def new
    @section  = Section.find params[:section_id]
    @question = @section.questions.build
  end

  def edit
    @section  = Section.find params[:section_id]
    @question = @section.questions.find params[:id] 
  end

  def create
    @section  = Section.find params[:section_id]
    @question = @section.questions.new(params[:question])

    if @question.save
      flash[:notice] = 'Question was successfully created.'
      redirect_to admin_section_path( @section )
    else
      render 'new'
    end
  end

  def update
    @section  = Section.find params[:section_id]
    @question = @section.questions.find(params[:id])

    if @question.update_attributes(params[:question])
      flash[:notice] = 'Question was successfully updated.'
      redirect_to admin_section_path( @section )
    else
      #flash[:error] = @question.errors.full_messages.to_sentence 
      render 'edit'
    end
  end

  def destroy
    @section  = Section.find params[:section_id]
    @question = @section.questions.find params[:id] 
    @question.destroy

    flash[:notice] = 'Question was successfully deleted.'
    redirect_to admin_section_path( @section )
  end
end
