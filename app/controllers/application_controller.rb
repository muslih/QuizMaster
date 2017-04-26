require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  include SessionHelper
  private


  def teacher_only!
  	redirect_to exams_path unless session[:auth] == 'teacher'
  end

	def login_only!
		redirect_to signin_path if current_user.blank?
	end

	def login_check!
		redirect_to root_path if current_user.blank?
	end 
	
	def set_participant
		@participant = Participant.find(session[:user_id]) if session[:auth] == 'participant'
	end

  def set_question
    @questions =  @participant.exams
  end

  def quiz_check
    redirect_to current_user if current_user.status
    redirect_to root_path if teacher?
  end
end
