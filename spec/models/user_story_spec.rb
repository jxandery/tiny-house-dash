require 'rails_helper'

RSpec.describe UserStory, type: :model do

  it 'has many categories' do
    us = UserStory.create(name: "Get rich quick")
    us.categories.create(name: "Tiny House slum lord")
    us.categories.create(name: "Learn programming")

    expect(us.categories.count).to eq(2)
    expect(us.categories.last.name).to eq("Learn programming")
  end
end
