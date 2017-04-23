class Participant < ApplicationRecord
  before_save :default_values
  before_save :random_question

	has_many :exams
  has_many :answers, :through => :exams
  has_many :questions, :through => :exams
  

  def self.doubt(id)
    @result = Exam.where(:participant_id => id,:doubt => true)
    return @result.count
  end

  def self.jawab(id)
    @student = Student.find(id)
    @student.exams.where.not(answer_id: nil).count
    # @result = Exam.where(:participant_id => id).not(:answer_id => nil)
    # return @result.count
  end 

  def self.blank(id)
    @result = Exam.where(:participant_id => id,:answer_id => nil).count
  end

  def self.ujian(code)
    @ujian =  Student.where(:code => code).order('created_at DESC')
  end

  def self.time(student)
    student.exams.first.created_at
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
