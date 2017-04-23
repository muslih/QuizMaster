class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :set_participant,except: [:grade,:grade_detail]
  before_action :set_question, only: [:index, :new]
  before_action :login_only!

  respond_to :html
  respond_to :js

  def index
    # @exams = Exam.all
    # generate_questions
    redirect_to new_exam_path
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    if @participant.exams.present?
      # redirect_to edit_exam_path(@participant.exams.first.id)
      redirect_to ujian_path
      @data = true
    else
      generate_questions
      @data = false
      redirect_to ujian_path
      # @exam = Exam.new
    end

  # @participant = participant.find(session[:participant]['id'])
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exams_path, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        if params[:lanjut].present?
          if params[:lanjut]  == "Next"
            format.html { redirect_to edit_exam_path(@exam.next.id)}#, notice: 'Lanjut.' }
            format.json { render :show, status: :ok, location: @exam }
            format.js { redirect_to edit_exam_path(@exam.next.id)}
          else
            format.html { redirect_to edit_exam_path(@exam.previous.id)}#, notice: 'Kembali' }
            format.json { render :show, status: :ok, location: @exam }
            format.js { redirect_to edit_exam_path(@exam.previous.id)}
          end
        end

        if params[:number].present?
          format.html { redirect_to edit_exam_path(params[:number])}#, notice: 'Lanjut.' }
          format.json { render :show, status: :ok, location: @exam }
        end

        if params[:finish].present?
          format.js {render :js => "window.location = '#{stats_exam_path}'"}
        end


      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finish
    flash[:success] = "Anda sudah selesai mengerjakan Ujian One Day Service, silahkan ambil hasil kepada panitia!"
    @participant.update(:status => true)

    # GRAD RESULT
    @max = Setting.first.grad

    # @data = val.to_f/max.to_f*100
    @data = (@participant.answers.where(:status=> true).count.to_f/@participant.exams.count.to_f) * 100
    
    @data.to_i

    if @data >= @max
      @result = true
      update_participant(@participant.code, @result.to_s)
      log_out
      redirect_to root_path 
    else
      @result = false
      update_participant(@participant.code, @result.to_s)
      log_out
      redirect_to root_path 
    end
  end

  def grade
    if params[:q]
      @participants = participant.where(:code => params[:q]).order('created_at DESC')
    end
  end

  def grade_detail
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:participant_id, :question_id, :answer_id,:doubt,:status)
    end

    def generate_questions
      @soal = @participant.q_list.split(",").map(&:to_i)

      @soal.each do |s|
        @question = Question.find(s.to_i)
        @participant.exams.create(:question_id => s)
      end

      return @exam = @participant.exams.first
    end

    def update_participant(code, status)
      @server = Setting.first
      @data = {code: code,exam: status}
      @uri = "#{@uri}updateparticipant?code=#{code}&exam=#{status}"
      rest_resource = RestClient::Resource.new(@uri)
      begin
        @request = rest_resource.put :content_type => "application/json"
      rescue Exception => e
        return false
      end
    end
end
  
