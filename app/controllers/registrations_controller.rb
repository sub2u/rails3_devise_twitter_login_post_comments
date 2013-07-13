class RegistrationsController < Devise::RegistrationsController

  def new
    cookies[:reference] = { :value => params[:reference], :expires => 10.days.from_now } if params[:reference]
    super
  end

  def create
    params[:user][:refered_code] = cookies[:reference] if cookies[:reference]
    super
  end

end