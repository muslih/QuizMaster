module SessionHelper

  def log_in(user)
    # for teacher
    # if user.try(:email)
      session[:auth]    = 'teacher'
      session[:user_id] = user.id

    # # for participant
    # else
    #   session[:auth]    = 'participant'
    #   session[:user_id] = user.id

    #   # if participant found
    #   @find_student = Student.where(:code => user['code'],:status=> nil)
    #   if @find_student.present?
    #     @ujian = @find_student.first
    #   else
	   #    false
    #   end
    #   session[:student] = @ujian
    # end
  end

	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
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
