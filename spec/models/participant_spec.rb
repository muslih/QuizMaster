require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe "Participant relationship" do
  	it { should have_many(:exams).dependent(:destroy) }

  	it "Has many through relationship" do
  		should have_many(:answers).through(:exams)
  		should have_many(:questions).through(:exams)
  	end
  end

  describe "Participant validation" do
  	it { should validate_presence_of(:name) }
  end
end
