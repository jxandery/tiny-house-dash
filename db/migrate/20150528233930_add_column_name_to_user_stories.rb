class AddColumnNameToUserStories < ActiveRecord::Migration
  def change
    add_column :user_stories, :name, :string
  end
end
