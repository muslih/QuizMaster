class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.boolean :status
      t.boolean :doubt

      t.timestamps
    end
  end
end
