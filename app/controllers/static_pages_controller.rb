class StaticPagesController < ApplicationController
  def home
    @user_stories = UserStory.all
  end
end
