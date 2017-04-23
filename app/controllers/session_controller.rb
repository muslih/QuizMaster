class SessionController < ApplicationController
  def new
  	render layout: 'login'
  end

  def create
  	user= User.find_by_email(params[:email])
  	if user && (user.authenticate(params[:password]) if user)
  		session[:user_id] = user.id
		  redirect_to root_path
		  flash.now[:success] = 'Welcome!'
	  else
	    flash.now[:danger] = 'Invalid email or password'
	    render 'new', layout: 'login'
	  end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
