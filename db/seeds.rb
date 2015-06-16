# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

us1 = UserStory.create(name: "Design a Tiny House")
us2 = UserStory.create(name: "Build a Tiny House")
us3 = UserStory.create(name: "Visit a Tiny House")

cat1 = Category.create(name: "Supplies",        user_story_id: us2.id)
cat2 = Category.create(name: "Roofing",         user_story_id: us2.id)
cat3 = Category.create(name: "Windows & Doors", user_story_id: us2.id)

cat3.items.create(name: "French Doors")
cat3.items.create(name: "Sliding Doors")
cat3.items.create(name: "Entry Doors")
