require 'rails_helper'

RSpec.describe Question, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "Question validation" do
  	it { should validate_presence_of(:content) }
  end

  describe "Question relationship" do

  	it { should have_many(:answers).inverse_of(:question) }

  	it "Question nested attributes" do 
  		should accept_nested_attributes_for(:answers)
  	end
  end
end
