class UserStoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def show
    @user_story = UserStory.find(params[:id])
  end
end
