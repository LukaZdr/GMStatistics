require "rails_helper"

RSpec.describe Api::V1::ServerStartsController do
  describe 'server start' do
    let(:do_request) { post :create, params: payload }
    context 'valid' do
      let(:payload) { {"time":1611871166.0,"action":"server_start"} }
      
      it 'POST server starts' do
        expect { do_request }.to change { ServerStart.count }.by(1)

        expect(response.code).to eq('200')
      end
    end
  end
end
