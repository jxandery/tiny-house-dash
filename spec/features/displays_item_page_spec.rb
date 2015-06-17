require 'rails_helper'

describe 'guest visits item page' do
  context 'category page' do
    it 'sees the specifics for an category' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")
      roofing.items.create(name: "asphalt shingles")

      visit '/'
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      save_and_open_page
      click_on('Roofing')
      expect(page).to have_content('shingles')
    end
  end
end
