class CreateCoachParticipants < ActiveRecord::Migration
  def change
    create_table :coach_participants do |t|
      t.integer :coach_id
      t.string :participant_id
      t.string :integer
      t.string :start_date
      t.string :date
      t.string :end_date
      t.string :date

      t.timestamps null: false
    end
    add_index :coach_participants, :coach_id
    add_index :coach_participants, :participant_id
    add_index :coach_participants, [:coach_id, :participant_id], unique: true
  end
end
