require 'rails_helper'


RSpec.describe ParticipantsController, type: :controller do
  include Rails.application.helpers
  let(:participant) { FactoryGirl.build_stubbed :participant}

  before(:each) do
    @user = FactoryGirl.create :user 
    log_in @user
  end

  describe 'GET #index' do
    before do
      get :index
    end
    context 'success http status' do
      it { should respond_with :ok }
      it { should render_template('index') }
    end
  end

  describe 'GET #new' do
    context 'success http status' do
      before do
        get :new
      end
      it { should respond_with :ok }
      it { should render_template('new') }
    end
  end

  describe 'POST #create' do
    context "successfuly created" do
      before do
        params = attributes_for(:participant)
        post :create, params: { participant: params }
      end

      it "added new user" do
        expect(Participant.count).to eq(1)
      end

      it "auto generate code" do 
        expect(participant.code).to_not eq("")
      end

      it "set success flash message" do 
        should set_flash[:success].to("Participant was successfully created.")
      end
    end

    context "unsuccessful create" do
      before do
        params = attributes_for(:participant, name:"")
        post :create, params: { participant: params }
      end
      it "unable to save user with blank name" do 
        expect(Participant.count).to eq(0)
      end

      it "set danger flash message" do 
        should set_flash[:danger].to('Participant was unsuccessfully created.')
      end

      it "back to new form" do
        should render_template('new') 
      end
    end
  end

  describe 'GET #edit' do 
    let(:participant) { create(:participant) }
    it "success opening page" do
      get :edit, params: {id: participant}
      should respond_with :ok
    end
  end

  describe 'PUT #update' do
    let(:participant) { create(:participant) }
    context 'success update' do 
      before do
        put :update, params: {id:participant, participant: attributes_for(:participant, name:"Name Participant")}
      end
      it "participant attributes updated" do
        expect(Participant.last.name).to eq("Name Participant")
        expect(Participant.last.name).not_to eq("Particpant Name")
      end
      it "show success flash message" do
        should set_flash[:success].to("Participant was successfully updated.")
      end
      it "redirect to participants path" do
        should redirect_to participants_url
      end
    end
    
    context 'failed update' do 
      before do
        put :update, params: {id:participant, participant: attributes_for(:participant, name:"")}
      end
      it "participant not updated" do
         expect(Participant.last.name).to_not eq("Name Participant")
        expect(Participant.last.name).to eq("Particpant Name")
      end
      it "render participant edit form" do
        should render_template('edit')
      end
    end
  end
  
  describe "delete #destroy" do
    let(:participant) { create(:participant) }
    before do 
      delete :destroy, params: {id:participant}
    end
    it "delete participant" do
      expect(User.count).to eq(1)
    end 
    it "show flash succes message" do 
      should set_flash[:success].to("Participant was successfully destroyed.")
    end 
    it "redirect to users path" do 
      should redirect_to participants_url
    end
  end

end
