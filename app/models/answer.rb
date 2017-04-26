class Answer < ApplicationRecord
  belongs_to :question
  
  has_many :exams
  has_many :participants, :through => :exams 

  validates :content, presence:true

  # # for multiple choice
  # def is_true?
  	
  # end

end
