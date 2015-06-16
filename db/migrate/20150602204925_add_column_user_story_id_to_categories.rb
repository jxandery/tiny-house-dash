class AddColumnUserStoryIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :user_story, index: true, foreign_key: true
  end
end
