class StaticController < ApplicationController
	before_action :login_only!
 	before_action :teacher_only! 
  def dashboard
  end
end
