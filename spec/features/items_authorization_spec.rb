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
      expect(page).to have_content('shingles')
      expect(page).to have_content('asphalt shingles')
      expect(page).to have_content("Guest User Suggested Item")
    end

    it 'updates item as admin' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")

      user1 = User.create(username: "admin-yes",
                          email: "admin@example.com",
                          password: "password",
                          admin: true)
      visit '/login'
      expect(page).to have_content('Log In')
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
      click_on('Submit')
      expect(page).to have_content('Log Out')
      expect(page).to have_content('Build a Tiny House')
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      click_on('Roofing')
      expect(page).to have_content('shingles')
      click_on('shingles')
      expect(page).to have_content('Update')
      click_on('Update')
      expect(page).to have_button("Update Name")
      fill_in "Name", with: "Updated Item"
      click_on('Update Name')
      expect(page).to have_content('Updated Item')
    end

    it 'does not update item as registered user and non-admin' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")

      user1 = User.create(username: "admin-no",
                          email: "admin@example.com",
                          password: "password",
                          admin: false)
      visit '/login'
      expect(page).to have_content('Log In')
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
      click_on('Submit')
      expect(page).to have_content('Log Out')
      expect(page).to have_content('Build a Tiny House')
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      click_on('Roofing')
      expect(page).to have_content('shingles')
      click_on('shingles')
      expect(page).to have_content('Update')
      click_on('Update')
      expect(page).to have_content('Not authorized')
    end

    it 'destroys item as admin' do
      us = UserStory.create(name: "Build a Tiny House")
      roofing = us.categories.create(name: "Roofing", user_story_id: us.id)
      roofing.items.create(name: "shingles")

      user1 = User.create(username: "admin-yes",
                          email: "admin@example.com",
                          password: "password",
                          admin: true)
      visit '/login'
      expect(page).to have_content('Log In')
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
      click_on('Submit')
      expect(page).to have_content('Log Out')
      expect(page).to have_content('Build a Tiny House')
      click_on('Build a Tiny House')
      expect(page).to have_content('Roofing')
      click_on('Roofing')
      expect(page).to have_content('shingles')
      click_on('shingles')
      expect(page).to have_content('Update')
      click_on('Delete')
      expect(page).not_to have_content('shingles')
    end
  end
end
