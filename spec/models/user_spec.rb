require 'rails_helper'

RSpec.describe User, type: :model do

  let(:coach)  { create(:user) }
  let(:coach2)  { create(:user) }
  let(:client)  { create(:user) }
  let(:client2)  { create(:user) }
  let(:coach_client) { create(:coach_client,
                               coach_id: coach.id,
                               client_id: client.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:coach_client2) { create(:coach_client,
                               coach_id: coach.id,
                               client_id: client2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:coach_client3) { create(:coach_client,
                               coach_id: coach2.id,
                               client_id: client.id,
                               start_date: Date.today,
                               end_date: nil
                     )}
  let(:coach_client4) { create(:coach_client,
                               coach_id: coach2.id,
                               client_id: client2.id,
                               start_date: Date.today,
                               end_date: nil
                     )}


  context 'user model methods' do
    it 'client has a coach' do
      coach_client

      expect(client.coach).to eql(coach)
    end

    it 'should be able to see client\'s coach history' do
      coach_client
      coach_client2
      coach_client3

      expect(client.coaches.count).to eql(2)
      expect(client.coaches).to include(coach)
      expect(client.coaches).to include(coach2)
    end

    it 'should be able to see coach\'s client history' do
      coach_client
      coach_client2
      coach_client3
      coach_client4

      expect(coach.clients.count).to eql(2)
      expect(coach.clients).to include(client)
      expect(coach.clients).to include(client2)
    end
  end
end
