require "rails_helper"

RSpec.describe Api::V1::UsersController, :type => :controller do
  describe 'POST /users' do
    let(:do_request) { post :create, params: {"user":{"steam_id":"STEAM_0:1:65586183","bot":false,"name":"Kieth Er'Brocken","user_id":2.0},"action":"player_join","time":1611656860.0} }

    it 'creates LoginTime when user joins' do
      expect { do_request }.to change { LoginTime.count }.by(1)
    end

    it 'creates a new user when the steam_id is new' do
      expect { do_request }.to change { User.count }.by(1)
    end

    it 'updates user name for user with existing steam_id' do
      FactoryBot.create(:user, steam_id: 'STEAM_0:1:65586183')
      expect(user.name).not_to eq("Kieth Er'Brocken")
      do_request
      expect(user.reload.name).to eq("Kieth Er'Brocken")


    end
  end

  describe 'PATCH /users/logout' do
  end
end