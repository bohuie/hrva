class AdminController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin
  
  
  def authenticate_admin
     if !current_user.try(:admin?)
       flash[:error] = "You do not have admin access to this area."
       redirect_to root_path
       return false
     end
  end 
end
