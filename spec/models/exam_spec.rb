require 'rails_helper'

RSpec.describe Exam, type: :model do

 	before(:each) do 
 		@question = Question.create(content:"First question",answer_type:"text")
  	@answer = @question.answers.create(content: "31", right: true)
  	@exam = @question.exams.create(status:nil)
 	end

  describe "Exam relationship" do
  	it { should belong_to(:participant) }
  	it { should belong_to(:question) }
  	it { should belong_to(:answer) }
  end

  describe "before update" do

  	it "should be correct answer with thirty one" do
  		@exam.update(value:"thirty one")
  		@exam.run_callbacks(:update) 

  		expect(@exam.value).to eq "thirty one"
  		expect(@exam.status).to eq true
  		expect(@exam.status).to_not eq nil
  	end

  	it "should be correct answer with THIRTY ONE" do
  		@exam.update(value:"THIRTY ONE")
  		@exam.run_callbacks(:update)

  		expect(@exam.value).to eq "THIRTY ONE"
  		expect(@exam.status).to eq true
  		expect(@exam.status).to_not eq nil
  	end

  	it "should be correct answer with Thirty One" do
  		@exam.update(value:"Thirty One")
  		@exam.run_callbacks(:update)

  		expect(@exam.value).to eq "Thirty One"
  		expect(@exam.status).to eq true
  		expect(@exam.status).to_not eq nil
  	end

  	it "should be correct answer with Thirty One" do
  		@exam.update(value:"thirty-one")
  		@exam.run_callbacks(:update)

  		expect(@exam.value).to eq "thirty-one"
  		expect(@exam.status).to eq true
  		expect(@exam.status).to_not eq nil
  	end

  	it "should be incorrect answer with 51" do
  		@exam.update(value:"51")
  		@exam.run_callbacks(:update)

  		expect(@exam.value).to eq "51"
  		expect(@exam.status).to eq false
  		expect(@exam.status).to_not eq nil
  	end
  end

  describe "methods" do

  end
end
