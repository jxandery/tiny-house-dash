class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|

      t.timestamps null: false
    end
  end
end
