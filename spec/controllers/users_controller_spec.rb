require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  include Rails.application.helpers

  before(:each) do
    @user = FactoryGirl.create :user, name: 'Teacher', email:'teacher@teacher.com', password:'teacher', password_confirmation:'teacher'
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
        params = attributes_for(:user)
        post :create, params: { user: params }
      end

      it "added new user" do
        expect(User.count).to eq(2)
      end
        
      it "redirect to index user path" do
        should redirect_to users_url
      end

      it "set success flash message" do 
        should set_flash[:success].to("User was successfully created.")
      end
    end

    context "unsuccessful create" do
      before do
        params = attributes_for(:user, name:"")
        post :create, params: { user: params }
      end
      it "unable to save user with blank email" do 
        expect(User.count).to eq(1)
      end

      it "back to new form" do
        should render_template('new') 
      end
    end
  end

  describe 'GET #edit' do 
    let(:user) { create(:user) }
    it "success opening page" do
      get :edit, params: {id: user}
      should respond_with :ok
    end
  end

  describe 'PUT #update' do
    let(:user) {create(:user)}
    context 'success update' do 
      before do
        put :update, params: {id:user, user: attributes_for(:user, name:"Endi", email:"endi@gmail.com")}
      end
      it "user attributes updated" do
        expect(User.last.name).to eq("Endi")
        expect(User.last.name).not_to eq("Muslih")
      end
      it "show success flash message" do
        should set_flash[:success].to("User was successfully updated.")
      end
      it "redirect to users path" do
        should redirect_to users_url
      end
    end
    
    context 'failed update' do 
      before do
        put :update, params: {user: attributes_for(:user,user_id:nil,name:nil),id:user}
      end
      it "user not updated" do
         expect(User.last.name).to eq("Muslih")
         expect(User.last.email).to eq("muslihzarth@gmail.com")
      end
      it "render user edit form" do
        should render_template('edit')
      end
    end
  end
  
  describe "delete #destroy" do
    let(:user) { create(:user) }
    before do 
      delete :destroy, params: {id:user}
    end
    it "delete user" do
      expect(User.count).to eq(1)
    end 
    it "show flash succes message" do 
      should set_flash[:success].to("User was successfully destroyed.")
    end 
    it "redirect to users path" do 
      should redirect_to users_url
    end
  end

end
