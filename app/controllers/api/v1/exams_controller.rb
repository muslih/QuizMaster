class Api::V1::ExamsController < Api::V1::BaseController 
	before_action :set_participant
	def index 
		respond_with @participant.exams.all if @participant.present?
	end

	def show
		if @participant.present?
			@exam = @participant.exams.find(params[:id]).question
		end
		unless params[:index]
			if @participant.present?
				@exam = @participant.exams.find(params[:id]).question
			end
			respond_with :api, :v1, @exam.to_json(include:[:answers]) if @participant.present?
		else
			{index: @participant.nomor_soal(params[:id])}.to_json
		end
	end 
end
