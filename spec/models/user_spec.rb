require 'rails_helper'

RSpec.describe User, type: :model do

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
  let(:coach_participant3) { create(:coach_participant,
                               coach_id: coach2.id,
                               participant_id: participant.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:coach_participant4) { create(:coach_participant,
                               coach_id: coach2.id,
                               participant_id: participant2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}


  context 'user model methods' do
    it 'participant has a coach' do
      coach_participant

      expect(participant.coach).to eql(coach)
    end

    it 'should be able to see participant\'s coach history' do
      coach_participant
      coach_participant2
      coach_participant3

      expect(participant.coaches.count).to eql(2)
      expect(participant.coaches).to include(coach)
      expect(participant.coaches).to include(coach2)
    end

    it 'should be able to see coach\'s participant history' do
      coach_participant
      coach_participant2
      coach_participant3
      coach_participant4

      expect(coach.participants.count).to eql(2)
      expect(coach.participants).to include(participant)
      expect(coach.participants).to include(participant2)
    end
  end
end
