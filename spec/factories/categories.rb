FactoryGirl.define do
  factory :category do
    name "category whatever"
    user_story
  end

end


#FactoryGirl.create(:item)

#Item.create!(
  #name: "asdlf",
  #category: Category.create!(
    #user_story: UserStory.create!(
      #name: "user story whatever"
    #),
    #name: "category whatever"
  #)
#)
