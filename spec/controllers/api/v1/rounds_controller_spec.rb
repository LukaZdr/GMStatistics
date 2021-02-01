require "rails_helper"

RSpec.describe Api::V1::RoundsController do
  let(:innocent) { create(:user) }
  let(:traitor) { create(:user) }
  let(:detective) { create(:user) }
  let(:spectator) { create(:user) }

  let(:payload) { { "detectives":[{ "items":0.0,"karma":1000.0,"user_steam_id": detective.steam_id,"credits":1.0,"ping":5.0,"stats":{"deaths":0.0,"score":8.0}}],
                    "spectators":[{ "items":0.0,"karma":1000.0,"user_steam_id": spectator.steam_id,"credits":0.0,"ping":5.0,"stats":{"deaths":0.0,"score":8.0}}],
                    "innocents":[{ "items":0.0,"karma":1000.0,"user_steam_id": innocent.steam_id,"credits":0.0,"ping":5.0,"stats":{"deaths":0.0,"score":8.0}}],
                    "traitors":[{ "items":0.0,"karma":1000.0,"user_steam_id": traitor.steam_id,"credits":3.0,"ping":5.0,"stats":{"deaths":0.0,"score":8.0}}],
                    "time":1611871750.0,
                    "action":"round_start",
                    "map":"ttt_waterworld"} }

  let(:do_create_request) { post :create, params: payload }
  let(:current_round) { Round.last }

  describe 'POST create' do
		context 'new map entry' do
      it 'creates a new map when no map has that name' do
        expect { do_create_request }.to change{ Map.count }.by(1)
      end

      it 'doesnt create a map if map with that name exists' do
        Map.create(name: 'ttt_waterworld')
        expect { do_create_request }.to change{ Map.count }.by(0)
			end
		end

		context 'Rounds' do
      it 'creates a new round' do
        expect { do_create_request }.to change{ Round.count }.by(1)
      end
		end


    context 'gamesession' do
      it 'should create a new gamesession when map is changed' do
        map = Map.create(name: 'ttt_other_map')
        GameSession.create(map: map)
        expect { do_create_request }.to change{ GameSession.count }.by(1)
      end

      it 'should keep the gamesession when map is the same' do
        map = Map.create(name: 'ttt_waterworld')
        GameSession.create(map: map)
        expect { do_create_request }.to change{ GameSession.count }.by(0)
      end
    end

    context 'roundparticipant' do
      it 'saves all roundparticipant' do
        expect { do_create_request }.to change{ RoundParticipant.count }.by(4)
      end

      it 'saves PingSampels for each user' do
        expect { do_create_request }.to change{ PingSample.count }.by(4)
      end

      it 'innocent should be saved with the right fields' do
        do_create_request
        inno = RoundParticipant.where(round: current_round, user: innocent, role: 'innocent', karma: 1000).first
        expect(inno).to be_present
      end

      it 'detective should be saved with the right fields' do
        do_create_request
        dete = RoundParticipant.where(round: current_round, user: detective, role: 'detective', karma: 1000).first
        expect(dete).to be_present
      end

      it 'traitor should be saved with the right fields' do
        do_create_request
        trait = RoundParticipant.where(round: current_round, user: traitor, role: 'traitor', karma: 1000).first
        expect(trait).to be_present
      end

      it 'spectator should be saved with the right fields' do
        do_create_request
				spec = RoundParticipant.where(round: current_round, user: spectator, role: 'spectator', karma: 1000).first
        expect(spec).to be_present
			end
		end
	end

  describe 'PATCH END' do
    before { do_create_request }
    let(:end_payload) { { "result":{ "dead":[ {"items":0.0,"role":"innocent","karma":1000.0,"user_steam_id": spectator.steam_id,"credits":3.0,"ping":5.0,"stats":{"deaths":0.0,"score":10.0}},
                                              {"items":0.0,"role":"detective","karma":1000.0,"user_steam_id": detective.steam_id,"credits":3.0,"ping":5.0,"stats":{"deaths":1.0,"score":10.0}}],
																		 "survived":[{"items":0.0,"role":"innocent","karma":1000.0,"user_steam_id": innocent.steam_id,"credits":3.0,"ping":5.0,"stats":{"deaths":0.0,"score":10.0}},
																									{"items":0.0,"role":"traitor","karma":1000.0,"user_steam_id": traitor.steam_id,"credits":3.0,"ping":5.0,"stats":{"deaths":0.0,"score":10.0}}]
																								},
                                     "time":1611871751.0,
                                     "reason":"win_traitor",
                                     "action":"round_end" } }
    let(:do_end_request) { patch :end, params: end_payload }

		context 'round' do
			it 'sets the correct win_reason to latest rounds' do
        do_end_request
        expect(current_round.reload.win_reason).to eq("win_traitor")
      end
    end
    
    context 'users' do
      it 'saves survived in players' do
        do_end_request
        expect(innocent.current_round_participant.survived).to eq(true)
        expect(traitor.current_round_participant.survived).to eq(true)
        expect(detective.current_round_participant.survived).to eq(false)
        expect(spectator.current_round_participant.survived).to eq(false)
			end
    end
	end
end
