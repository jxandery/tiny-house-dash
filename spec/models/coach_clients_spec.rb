require 'rails_helper'

RSpec.describe CoachClient, type: :model do

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

  context 'coach-client relationship' do
    it "should be valid" do
      expect(coach_client.valid?).to be true
    end

    it "should require a coach_id" do
      coach_client.coach_id = nil
      expect(coach_client.valid?).to be false
    end

    it "should require a client_id" do
      coach_client.client_id = nil
      expect(coach_client.valid?).to be false
    end

    it "should require a start_date" do
      coach_client.start_date = nil
      expect(coach_client.valid?).to be false
    end

    it 'coach should have multiple clients' do
      coach_client
      coach_client2

      expect(coach.clients.count).to eql(2)
    end
  end
end
