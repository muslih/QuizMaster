class Answer < ApplicationRecord
  belongs_to :question
  has_many :exams
  has_many :participants, :through => :exams 
end
