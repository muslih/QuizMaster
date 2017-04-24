class StaticController < ApplicationController
	before_action :login_only!
	before_action :teacher_only!, except: [:exam]
  before_action :set_participant,only: [:exam]
  before_action :quiz_check,only: [:exam]
  
  def dashboard
  end

  def setting
  end

  def update
  end

  def exam
  end
  
end
