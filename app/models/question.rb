class Question < ApplicationRecord
	include Bootsy::Container

  has_many :answers, dependent: :destroy, inverse_of: :question  
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :content, presence:true
  validates :answer_type, presence:true

	validate :answer_limit 

	def answer_limit
		if answer_type == 'text'
  		errors.add(:answers, "You sir, have too many answer! #{answers.length}") if self.answers.length > 1
  	end
  end

end
