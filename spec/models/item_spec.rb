require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'belongs to one category' do
    cat1 = Category.create(name: "Windows & Doors")
    item1 = Item.new(name: "Alumnimum Window", category_id: cat1.id)
    expect(item1.category.name).to eq("Windows & Doors")
  end
end
