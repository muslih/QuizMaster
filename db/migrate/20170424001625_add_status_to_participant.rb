class AddStatusToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :status, :boolean, default:false
  end
end
