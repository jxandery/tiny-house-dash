class AddIndexToClient < ActiveRecord::Migration
  def change
    add_index :coach_clients, :coach_id
    add_index :coach_clients, :client_id
    add_index :coach_clients, [:coach_id, :client_id], unique: true
  end
end
