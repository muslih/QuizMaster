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
    if question.answer_type == 'text'
      # value = self.value.downcase
      answer_right = question.answer_right.content
      answer_right_int = question.answer_right.content.to_i

      if value == answer_right || value = answer_right_int.read_num || value = answer_right_int.read_num.gsub(' ','-') || answer_right_int.read_num.titleize || answer_right_int.read_num.capitalize || answer_right_int.read_num.upcase
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

  def correct_text?(value)
    return true if value == answer_right || value = answer_right_int.read_num || value = answer_right_int.read_num.gsub(' ','-') || answer_right_int.read_num.titleize || answer_right_int.read_num.capitalize || answer_right_int.read_num.upcase
  end

  def correct_choice?(value)
    return true if answer_id == question.answer_right.id
  end
end


