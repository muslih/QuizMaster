class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :code
      t.string :q_list

      t.timestamps
    end
  end
end
