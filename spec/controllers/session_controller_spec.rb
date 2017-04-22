require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  let(:user) { build :user}
  
  describe "GET #new" do
    context "unauthenticated users" do
      setup { get :new }
      it "returns http success" do
        should respond_with :ok
        should render_with_layout :login
        should render_template('new')
        #get :new
        #expect(response).to have_http_status(:success)
      end
    end

    context "authenticated users" do

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
        expect(flash[:success]).to eq("Sign in successfull")
      end

    end

    context "unsuccessful signin" do

    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
