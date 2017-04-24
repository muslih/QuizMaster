class Question < ApplicationRecord
	include Bootsy::Container
  has_many :answers, dependent: :destroy, inverse_of: :question  
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :content, presence:true
end
