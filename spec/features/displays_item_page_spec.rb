require 'rails_helper'

describe 'guest visits item page' do
  context 'category page' do
    it 'sees the specifics for an category' do
      Category.create(name: "Design a Tiny House")
      Category.create(name: "Design a Tiny House")

      visit  ''
      click_on('Build a Tiny House')
      expect(current_path).to eq(user_story_path(2))

      expect(page).to have_content('Supplies')
      expect(page).to have_content('Roofing')
      expect(page).to have_content('Windows & Doors')
    end
  end
end
