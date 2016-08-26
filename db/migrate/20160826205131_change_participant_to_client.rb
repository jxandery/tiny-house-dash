class ChangeParticipantToClient < ActiveRecord::Migration
  def change
    rename_table :coach_participants, :coach_clients
    rename_column :coach_clients, :participant_id, :client_id
  end
end
