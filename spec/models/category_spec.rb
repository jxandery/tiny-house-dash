require 'rails_helper'

RSpec.describe Category, type: :model do

   it 'belongs to one user story' do
     us1 = UserStory.create(name: "Funny Story")
     cat1 = us1.categories.create(name: "LOL Funny")

     expect(cat1.user_story_id).to eq(us1.id)
   end

   it 'has many items' do
     cat1 = Category.create(name: "Roofing")
     cat1.items.create(name: "Asphalt shingles")
     cat1.items.create(name: "Rubber membrane")
     expect(cat1.items.count).to eq(2)
   end
end
