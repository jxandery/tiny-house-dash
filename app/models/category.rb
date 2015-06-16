class Category < ActiveRecord::Base
  belongs_to :user_story
  has_many :items
end
