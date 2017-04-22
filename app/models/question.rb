class Question < ApplicationRecord
	belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :exams, dependent: :destroy
  
  accepts_nested_attributes_for :answers, allow_destroy: true
end
