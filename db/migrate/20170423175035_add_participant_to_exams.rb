class AddParticipantToExams < ActiveRecord::Migration[5.0]
  def change
    add_reference :exams, :participant, foreign_key: true
  end
end
