class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :coach_id
      t.integer :participant_id
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
    add_index :relationships, :coach_id
    add_index :relationships, :participant_id
    add_index :relationships, [:coach_id, :participant_id], unique: true
  end
end
