require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:coach)  { create(:user) }
  let(:coach2)  { create(:user) }
  let(:participant)  { create(:user) }
  let(:participant2)  { create(:user) }
  let(:relationship) { create(:relationship,
                               coach_id: coach.id,
                               participant_id: participant.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:relationship2) { create(:relationship,
                               coach_id: coach.id,
                               participant_id: participant2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:relationship3) { create(:relationship,
                               coach_id: coach2.id,
                               participant_id: participant2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}

  context 'coach-participant relationship' do
    xit "should be valid" do
      expect(relationship.valid?).to be true
    end

    xit "should require a coach_id" do
      relationship.coach_id = nil
      expect(relationship.valid?).to be false
    end

    xit "should require a participant_id" do
      relationship.participant_id = nil
      expect(relationship.valid?).to be false
    end

    xit "should require a start_date" do
      relationship.start_date = nil
      expect(relationship.valid?).to be false
    end

    xit 'coach should have multiple participants' do
      relationship
      relationship2

      expect(coach.participants.count).to eql(2)
    end

    it 'participant should have one coach' do
      relationship
      relationship2
      relationship3

      expect(participant.coach).to eql(1)
    end

     #it 'belongs to one user story' do
       #us1 = UserStory.create(name: "Funny Story")
       #cat1 = us1.categories.create(name: "LOL Funny")

       #expect(cat1.user_story_id).to eq(us1.id)
     #end

     #it 'has many items' do
       #cat1 = Category.create(name: "Roofing")
       #cat1.items.create(name: "Asphalt shingles")
       #cat1.items.create(name: "Rubber membrane")
       #expect(cat1.items.count).to eq(2)
     #end
  end
end
