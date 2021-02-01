require "rails_helper"

RSpec.describe Api::V1::UsersController, :type => :controller do
  describe 'POST /users' do
    let(:do_request) { post :create, params: payload }

    context 'with valid payload' do
      let(:payload) { { "user":{ "steam_id":"123465789","bot":false,"name":"test_schmest","user_id":2.0 },"action":"player_join","time":1611656860.0 } } 

      it 'creates LoginTime when user joins' do
        expect { do_request }.to change { LoginTime.count }.by(1)
      end

      it 'creates a new user when the steam_id is new' do
        expect { do_request }.to change { User.count }.by(1)
      end

      it 'updates user name for user with existing steam_id' do
        user = create(:user, steam_id: '123465789')
        expect(user.name).not_to eq("test_schmest")
        do_request
        expect(user.reload.name).to eq("test_schmest")
      end

      it 'returns a 200' do
        do_request
        expect(response.code).to eq('200')
      end
    end

    context 'with invalid payload' do
      let(:payload) { { "user":{ "bot":false,"name":"test_schmest","user_id":2.0 },"action":"player_join","time":1611656860.0 } }
      
      it 'returns a 500' do
        do_request
        expect(response.code).to eq('500')
      end
    end
  end

  describe 'PATCH /users/logout' do
    let!(:user) { create(:user) }
    let(:do_request) { patch :logout, params: {"user":{"steam_id": user.steam_id,"reason":"Disconnect by user.","user_id":4.0,"bot":0.0,"name": user.name},"action":"player_disconnect","time":1611871759.0 } }

    it 'fills in logout and logout reason in user' do
      login_time = create(:login_time, user: user)

      expect(login_time.logout).to be_blank
      expect(login_time.logout_reason).to be_blank

      do_request

      expect(login_time.reload.logout).to be_present
      expect(login_time.logout_reason).to eq('Disconnect by user.')
    end
  end
end
