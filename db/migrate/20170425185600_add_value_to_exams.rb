class AddValueToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :value, :string
  end
end
