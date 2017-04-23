class Exam < ApplicationRecord
  belongs_to :participant
  belongs_to :question
  belongs_to :answer
  has_many :answers,:through => :question

  scope :next, lambda {|id,s_id| where("id > ? AND student_id = ? ",id,s_id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id,s_id| where("id < ? AND student_id = ?",id, s_id).order("id DESC") }

  def next
    Exam.next(self.id,self.student.try(:id)).first
  end

  def previous
    Exam.previous(self.id,self.student.try(:id)).first
  end
end
