class Admin::UsersController < AdminController
  
  def index
    @users = User.paginate(default_pagination_params.merge(:order => 'username'))  
  end
  
  def show
    @user = User.find(params[:id])
    render 'users/show'
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:active, !@user.active)
    flash[:notice] = (@user.active? ? 'You have successfully activated the account.' : 'You have deactivated the account.' )+" #{@user.login}" 
    redirect_to admin_users_path
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? 
      params[:user].delete(:password) 
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank? 
    end 
    if @user.update_attributes(params[:user])
      flash[:notice] = 'You have successfully updated the account.'
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'You have successfully created a new account.'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
end
