class Exam < ApplicationRecord
  include ReadNumber
  belongs_to :participant
  belongs_to :question,optional: true
  belongs_to :answer, optional: true
  
  has_many :answers,:through => :question

  before_update :correct_answer

  scope :next, lambda {|id,s_id| where("id > ? AND participant_id = ? ",id,s_id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id,s_id| where("id < ? AND participant_id = ?",id, s_id).order("id DESC") }

  def next
    Exam.next(self.id,self.participant.try(:id)).first
  end

  def previous
    Exam.previous(self.id,self.participant.try(:id)).first
  end

  def correct_answer
    if question.try(:answer_type) == 'text'
      answer_right = question.answer_right.content
      answer_right_int = question.answer_right.content.to_i

      if value == answer_right
        self.status = true
      elsif value === answer_right_int.read_num
        self.status = true
      elsif value === answer_right_int.read_num.gsub(' ','-')
        self.status = true
      elsif value == answer_right_int.read_num.titleize
        self.status = true
      elsif value == answer_right_int.read_num.capitalize
        self.status = true
      elsif value == answer_right_int.read_num.upcase
        self.status = true
      else
        self.status = false
      end
    else
      if correct_choice?(answer)
        self.status = true
      else
        self.status = false
      end
    end
  end


  def correct_choice?(value)
    return true if answer_id == question.answer_right.id
  end

  def your_answer
    if question.try(:answer_type) == 'text'
      value
    else
      answer.try(:content)
    end
  end

  def answer_right
    question.try(:answer_right)
  end
end


