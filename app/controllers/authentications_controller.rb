class AuthenticationsController < ApplicationController
	# before_filter :authenticate_user!  
skip_before_filter :authenticate_user!, :only => :create
	def index
    @authentications = current_user.authentications if current_user
  	end
  
  def create
    omniauth = request.env["omniauth.auth"]
    @user, new_reg = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
      if new_reg == true
        sign_in @user
      else      
        sign_in @user
      end
    redirect_to root_path
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = t('authentications_controller.sucessfully_destroyed_authentication')
    redirect_to authentications_url
  end
  
  def failure
  	redirect_to dashboard_path
  end
  
end