class FixUserTableFields < ActiveRecord::Migration
  def change
    remove_column :coach_participants, :integer, :string
    remove_column :coach_participants, :date, :string

    remove_column :coach_participants, :participant_id, :string
    add_column :coach_participants, :participant_id, :integer

    remove_column :coach_participants, :start_date, :string
    add_column :coach_participants, :start_date, :date

    remove_column :coach_participants, :end_date, :string
    add_column :coach_participants, :end_date, :date
  end
end
