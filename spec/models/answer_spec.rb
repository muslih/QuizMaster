require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Answer relationship" do
  	it { should belong_to(:question) }

  	it { should have_many(:exams) }
  	it { should have_many(:participants).through(:exams) }
  end

  describe "Answer validation" do
  	it { should validate_presence_of(:content) }
  end
end
