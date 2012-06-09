class Admin::SectionsController < AdminController

  def index
    @sections = Section.all
  end

  def show
    @section   = Section.find(params[:id])
    @questions = @section.questions.all
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
        flash[:notice] = 'Section was successfully created.'
        redirect_to [:admin, @section]
      else
        render 'new'
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = 'Section was successfully updated.'
      redirect_to [:admin, @section]
    else
      flash[:notice] = @section.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = 'Section was successfully deleted.'
    redirect_to admin_sections_path 
  end
end
