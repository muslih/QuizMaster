class QuestionsController < ApplicationController
  before_action :login_only!
  before_action :teacher_only!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    4.times {@question.answers.build}
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if @question.save
      flash.now[:success] = 'Question was successfully created.' 
      redirect_to @question
    else
      @model = @question
      flash.now[:danger] = "Question can not be update!"
      render :new
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    # filtered_params 
    if @question.update_attributes(question_params)
        flash.now[:success] = 'Question was successfully updated.'
        redirect_to @question 
      else
        @model = @question
        flash.now[:danger] = "Question can not be update!"
        render :new
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content,:bootsy_image_gallery_id,:answer_type, answers_attributes: [:id, :question_id, :content,:right])
    end

    # def question_one
    #   params.require(:question).permit(:content,:bootsy_image_gallery_id, :answer_type, answers_attributes: [0: {:id, :question_id, :content,:right} ])
    # end
end
