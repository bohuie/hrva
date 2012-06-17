class Admin::RegionsController < AdminController
  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
    @region = Region.new
  end

  def edit
    @region = Region.find(params[:id])
  end

  def create
    @region = Region.new(params[:region])

    if @region.save
      flash[:notice] = 'Region was successfully created.'
      redirect_to [:admin, @region]
    else
      render 'new'
    end
  end

  def update
    @region = Region.find(params[:id])

    if @region.update_attributes(params[:region])
      flash[:notice] = 'Region was successfully updated.'
      redirect_to [:admin, @region]
    else
      flash[:notice] = @region.errors.full_messages.to_sentence 
      render 'edit'
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] = 'Region was successfully deleted.'
    redirect_to admin_regions_path 
  end
end
