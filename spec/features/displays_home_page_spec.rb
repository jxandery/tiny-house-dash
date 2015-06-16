require 'rails_helper'

describe 'guest visits homepage' do
  context 'landing page' do
    it 'clicks on a user story and sees a list of categories for that page' do
      us1 = UserStory.create(name: "Design a Tiny House")
      us2 = UserStory.create(name: "Build a Tiny House")
      us3 = UserStory.create(name: "Visit a Tiny House")

      us2.categories.create(name: "Supplies")
      us2.categories.create(name: "Roofing")
      us2.categories.create(name: "Windows & Doors")

      visit root_path
      click_link "Build a Tiny House"
      expect(current_path).to eq(user_story_path(2))

      expect(page).to have_content('Supplies')
      expect(page).to have_content('Roofing')
      expect(page).to have_content('Windows & Doors')
    end
  end
end
