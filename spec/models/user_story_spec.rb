require 'rails_helper'

RSpec.describe UserStory, type: :model do

  it 'has many categories' do
    us = UserStory.create(name: "Get rich quick")
    cat1 = us.categories.create(name: "Tiny House slum lord")
    cat2 = us.categories.create(name: "Learn programming")

    expect(us.categories).to match_array([cat1, cat2]) #match_array says make sure that the elements in the array are present and the order doesn't matter
  end

  it 'has many categories using factory girl' do
    us1 = create(:user_story)
    cat1 = create(:category, user_story: us1)
    cat2 = create(:category, user_story: us1)

    expect(us1.categories).to match_array([cat1, cat2]) #match_array says make sure that the elements in the array are present and the order doesn't matter
  end

end
