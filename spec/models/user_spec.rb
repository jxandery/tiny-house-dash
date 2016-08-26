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
                               participant_id: participant.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:relationship4) { create(:relationship,
                               coach_id: coach2.id,
                               participant_id: participant2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}


  context 'user model methods' do
    it 'participant has a coach' do
      relationship

      expect(participant.coach).to eql(coach)
    end

    it 'should be able to see participant\'s coach history' do
      relationship
      relationship2
      relationship3


      expect(participant.coach_history.count).to eql(2)
      expect(participant.coach_history).to include(coach)
      expect(participant.coach_history).to include(coach2)
    end

    it 'should be able to see coach\'s participant history' do
      relationship
      relationship2
      relationship3
      relationship4

      expect(coach.participant_history.count).to eql(2)
      expect(coach.participant_history).to include(participant)
      expect(coach.participant_history).to include(participant2)
    end
  end
end
