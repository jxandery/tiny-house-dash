require 'rails_helper'

RSpec.describe CoachParticipant, type: :model do

  let(:coach)  { create(:user) }
  let(:coach2)  { create(:user) }
  let(:participant)  { create(:user) }
  let(:participant2)  { create(:user) }
  let(:coach_participant) { create(:coach_participant,
                               coach_id: coach.id,
                               participant_id: participant.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:coach_participant2) { create(:coach_participant,
                               coach_id: coach.id,
                               participant_id: participant2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}

  context 'coach-participant relationship' do
    it "should be valid" do
      expect(coach_participant.valid?).to be true
    end

    it "should require a coach_id" do
      coach_participant.coach_id = nil
      expect(coach_participant.valid?).to be false
    end

    it "should require a participant_id" do
      coach_participant.participant_id = nil
      expect(coach_participant.valid?).to be false
    end

    it "should require a start_date" do
      coach_participant.start_date = nil
      expect(coach_participant.valid?).to be false
    end

    it 'coach should have multiple participants' do
      coach_participant
      coach_participant2

      expect(coach.participants.count).to eql(2)
    end
  end
end
