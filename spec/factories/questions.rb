FactoryGirl.define do
  factory :question do
    content "The first question"
    answer_type "text"
  end

  trait :with_answers_true do
    after :build do |question|
      FactoryGirl.create :answer, :question => question
    end
  end

  trait :with_answers_false do
    after :build do |question|
      FactoryGirl.create :answer_true, :question => question
    end
  end
end
