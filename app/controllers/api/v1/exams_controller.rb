class Api::V1::ExamsController < Api::V1::BaseController 
	before_action :set_participant
	def index 
		respond_with @participant.exams.all if @participant.present?
	end

	def show
		if @participant.present?
			@exam = @participant.exams.find(params[:id]).question
			# @exam = @exam.attributes.merge(index: @participant.nomor_soal(@exam.id))
		end
		unless params[:index]
			# @exam = @participant.exams.find(params[:id]).join(:question, :answers)
			if @participant.present?
				@exam = @participant.exams.find(params[:id]).question
				# @exam = @exam.attributes.merge(index: @participant.nomor_soal(@exam.id))
			end
			respond_with :api, :v1, @exam.to_json(include:[:answers]) if @participant.present?
			# render json: { @exam , index: @participant.nomor_soal(@exam.id) }
		else
			{index: @participant.nomor_soal(params[:id])}.to_json
		end
	end 
end
