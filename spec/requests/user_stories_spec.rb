it 'updates user_story as admin' do
  create(:user_story, name: "the old man in the shoe")
  log_in admin: true
  visit user_stories_path
  page.should have_content("the old man in the show")
  click on "Edit"
  fill_in "Name", with: "New Name"
  click_on "Update User Story"
  page.should have_content("Updated User Story")
  page.should have_content("New Name")
  page.should_not have_content("Old Name")
end

it "cannot edit user story as non-admin" do
  log_in admin: false
  topic = create(:user_story)
  visit edit_user_story_path(user_story)
  page.should have_content("Not Authorized")
end

it "destroys user story as admin" do
  create(:user_story, name: "Oops")
  log_in admin: true
  visit user_stories_path
  page.should have_content("Ooops")
  click_on "Destroy"
  page.should have_content("Destroyed User Story")
  page.should_not have_content("Ooops")
end


