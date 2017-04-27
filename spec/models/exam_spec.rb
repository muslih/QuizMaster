require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe "Exam relationship" do
  	it { should belong_to(:participant) }
  	it { should belong_to(:question) }
  	it { should belong_to(:answer) }
  	it { should have_many(:answers).through(:question) }
  end
end
