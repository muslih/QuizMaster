class SessionController < ApplicationController
  def new
  	render layout: 'login'
  end

  def create
    unless params.has_key?(:code)
    	user = User.find_by_email(params[:email].downcase)
    	if user && (user.authenticate(params[:password]) if user)
    		log_in user
        flash[:success] = 'Welcome Teacher!'
  		  redirect_to root_path
  	  else
  	    flash.now[:danger] = 'Invalid email or password'
  	    render 'new', layout: 'login'
  	  end
    else
      participant = Participant.find_by_code(params[:code])
      if participant.present?
        log_in participant
        flash[:success] = 'Welcome!'
        redirect_to exams_path
      else
        flash.now[:danger] = 'Invalid quiz code!'
        render 'new', layout: 'login'
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
