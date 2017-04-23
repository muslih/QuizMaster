class Participant < ApplicationRecord
  before_save :default_values

	has_many :exams
  has_many :answers, :through => :exams
  has_many :questions, :through => :exams
  

  def self.doubt(id)
    @result = Exam.where(:student_id => id,:doubt => true)
    return @result.count
  end

  def self.jawab(id)
    @student = Student.find(id)
    @student.exams.where.not(answer_id: nil).count
    # @result = Exam.where(:student_id => id).not(:answer_id => nil)
    # return @result.count
  end 

  def self.blank(id)
    @result = Exam.where(:student_id => id,:answer_id => nil).count
  end

  def self.ujian(code)
    @ujian =  Student.where(:code => code).order('created_at DESC')
  end

  def self.time(student)
    student.exams.first.created_at
  end

  def self.nomor_soal(id,no)
    @student = Student.find(id)
    @a = 1
    @student.exams.each do |soal|
      if soal.id == no
        @data = @a
      end
      @a = @a + 1
    end
    return "#{@data} ) . "
  end

  def default_values
    val = ('0'..'9').to_a.shuffle.first(5).join
    self.code ||= val.to_s
  end
end
