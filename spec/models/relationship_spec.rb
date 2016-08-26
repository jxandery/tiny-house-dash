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

  context 'coach-participant relationship' do
    it "should be valid" do
      expect(relationship.valid?).to be true
    end

    it "should require a coach_id" do
      relationship.coach_id = nil
      expect(relationship.valid?).to be false
    end

    it "should require a participant_id" do
      relationship.participant_id = nil
      expect(relationship.valid?).to be false
    end

    it "should require a start_date" do
      relationship.start_date = nil
      expect(relationship.valid?).to be false
    end

    it 'coach should have multiple participants' do
      relationship
      relationship2

      expect(coach.participants.count).to eql(2)
    end
  end
end
