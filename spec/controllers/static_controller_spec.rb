require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  include Rails.application.helpers

  before(:each) do
    @user = FactoryGirl.create :user
    log_in @user
  end
  describe "GET #dashboard" do
    context "returns http success" do
      setup { get :dashboard }
      it { should respond_with :ok }
      it { should render_template('dashboard') }
    end
  end
end