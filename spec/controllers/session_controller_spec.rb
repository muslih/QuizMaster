require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  let(:user) { FactoryGirl.build :user}
  
  describe "GET #new" do
    context "unauthenticated users" do
      setup { get :new }
      it "returns http success" do
        should respond_with :ok
        should render_with_layout :login
        should render_template('new')
      end
    end

    context "authenticated users" do
      it "redirect to the root path" do
        session[:user_id] = user.id

        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  

  describe "POST #create" do
    context "successfull signin" do
      before do 
        post :create, {email: user.email, password: user.password}
      end 
      
      it "redirect to root path" do
        expect(response).to redirect_to root_path
      end

      it "set success flash message" do
        expect(flash[:success]).to eq("Welcome Teacher")
      end

      it "creates a session record for valid input" do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "unsuccessful signin" do

    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy
      should redirect_to root_path
    end
  end

end
