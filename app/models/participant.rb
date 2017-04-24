class Participant < ApplicationRecord
  before_save :default_values
  before_save :random_question

	has_many :exams,dependent: :destroy
  has_many :answers, through: :exams
  has_many :questions, through: :exams
  
  validates :name, presence: true

  def blank
    self.exams.where(answer_id:nil).count
  end

  def doubt
    self.exams.where(doubt:true).count
  end

  def answered
    self.exams.where.not(answer_id:nil).count
  end

  def correct_answers
    self.exams.where(status:true).count
  end

  def result
    "#{self.correct_answers} of #{self.questions.count} Questions"
  end

  def percentage
    result = (correct_answers*100)/Question.count
    "#{result} %"
  end

  def self.taken
    where(status:true).count
  end

  def self.not_taken
    where(status:false).count
  end

  def self.doubt(id)
    @result = Exam.where(:participant_id => id,:doubt => true)
    return @result.count
  end

  def self.jawab(id)
    @participant = Participant.find(id)
    @participant.exams.where.not(answer_id: nil).count
    # @result = Exam.where(:participant_id => id).not(:answer_id => nil)
    # return @result.count
  end 

  def self.blank(id)
    @result = Exam.where(:participant_id => id,:answer_id => nil).count
  end

  def self.nomor_soal(id,no)
    @participant = Participant.find(id)
    @a = 1
    @participant.exams.each do |soal|
      if soal.id == no
        @data = @a
      end
      @a = @a + 1
    end
    return "#{@data}"
  end

  def default_values
    val = ('0'..'9').to_a.shuffle.first(5).join
    self.code ||= val.to_s
  end

  def random_question
    # @questions = ""
    @questions = []
    
    Question.limit(5).order("RANDOM()").each do  |que|
      @questions << que.id.to_s
    end
    
    @question_list =  @questions.join(",")

    self.q_list = @question_list
  end
end
