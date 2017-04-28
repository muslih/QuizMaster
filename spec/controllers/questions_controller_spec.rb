require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  include Rails.application.helpers

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
        params = attributes_for(:question, :with_answers_true)
        post :create, params: {question: params }
      end

      it "added new user" do
        expect(Question.count).to eq(1)
      end
        
      it "redirect to index user path" do
        should redirect_to question_path(Question.last.id)
      end

      it "set success flash message" do 
        should set_flash.now[:success].to('Question was successfully created.')
      end
    end

    context "unsuccessful create" do
      before do
        params = attributes_for(:question, content:"")
        post :create, params: { question: params }
      end
      it "unable to save user with blank content" do 
        expect(Question.count).to eq(0)
      end

      it "back to new form" do
        should render_template('new') 
      end
    end
  end

  describe 'GET #edit' do 
    let(:question) { create(:question) }
    it "success opening page" do
      get :edit, params: {id: question}
      should respond_with :ok
    end
  end

  describe 'PUT #update' do
    let(:question) {create(:question)}
    context 'success update' do 
      before do
        put :update, params: {id: question, question: attributes_for(:question, content:"The Updated question")}
      end
      it "user attributes updated" do
        expect(Question.last.content).to eq("The Updated question")
        expect(Question.last.content).not_to eq("The first question")
      end
      it "show success flash message" do
        should set_flash.now[:success].to("Question was successfully updated.")
      end
      it "redirect to questions path" do
        expect(response).to redirect_to(Question.last)
      end
    end
    
    context 'failed update' do 
      before do
        put :update, params: {question: attributes_for(:question,content:nil),id: question}
      end
      it "user not updated" do
         expect(Question.last.content).to eq("The first question")
      end
      it "render question edit form" do 
        should render_template('edit')
      end
    end
  end
  
  describe "delete #destroy" do
    let(:question) { create(:question) }

    before do 
      delete :destroy, params: {id: question}
    end
    it "deleted user" do
      expect(Question.count).to eq(0)
    end 
    it "show flash succes message" do 
      should set_flash.now[:success].to("Question was successfully destroyed.")
    end 

    it "redirect to questions path" do 
      expect(response).to redirect_to(questions_url)
    end
  end

end
