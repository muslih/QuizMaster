require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validation" do
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:email) }
  	it { should allow_value('muslih@muslih.me').for(:email) }
  end

  describe "User secure password" do
  	it { should have_secure_password }
  end
end
