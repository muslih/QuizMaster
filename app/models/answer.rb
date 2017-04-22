class Answer < ApplicationRecord
	include Bootsy::Container
  belongs_to :question
  has_many :exams
  has_many :participants, :through => :exams 

  validates :content, presence:true
end
