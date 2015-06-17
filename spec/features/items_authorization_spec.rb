require 'rails_helper'

describe 'restrict guest and admin access' do
  context 'item page' do
    it 'lists items as guest' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")
      roofing.items.create(name: "asphalt shingles")

      visit '/'
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      click_on('Roofing')
      expect(page).to have_content('shingles')
      expect(page).to have_content('asphalt shingles')
    end

    it 'creates item as registered user' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")
      roofing.items.create(name: "asphalt shingles")

      visit '/'
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      click_on('Roofing')
      fill_in "Name", with: "Guest User Suggested Item"
      click_on("Create New Item")
      save_and_open_page
      expect(page).to have_content('shingles')
      expect(page).to have_content('asphalt shingles')
      expect(page).to have_content("Guest User Suggested Item")
    end

  end
end
