class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :teacher_only!, except: [:show,:submit]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to participants_path
      flash[:success] = "Participant was successfully created."
    else
      flash[:danger] = "Participant was unsuccessfully created."
      render :new
    end
  end

  def submit
    if current_user.update(status:true)
      flash[:success] = "Quiz was successfully submited."
      redirect_to current_user
    else
      flash.now[:success] = "Quiz was successfully submited."
      redirect_to first_exam_path
    end

  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    if @participant.update(participant_params)
      flash[:success] = 'Participant was successfully updated.'
      redirect_to participants_url
    else
      flash[:danger] = 'Failed to update participant.'
      render :edit
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    flash[:success] = 'Participant was successfully destroyed.'
    redirect_to participants_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name)
    end
end
