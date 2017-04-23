module SessionHelper

  def log_in(user)
    # for teacher
    if user.try(:email)
      session[:auth]    = 'teacher'
      session[:user_id] = user.id
    else
      session[:auth]    = 'participant'
      session[:user_id] = user.id
    end 
  end
  
  def current_user
    if session[:auth] == 'teacher'
      @current_user ||= User.find(session[:user_id]) 
    elsif session[:auth] == 'participant'
      @current_user ||= Participant.find(session[:user_id])
    else
      false
    end 
  end

  def logged_in?
    !current_user.nil?
  end

  def teacher?
    session[:auth] == 'teacher'
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:auth)
    @current_user = nil
  end
end
