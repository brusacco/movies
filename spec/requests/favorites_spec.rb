require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let!(:user) { create(:user) }
  let!(:movies) { create_list(:movie, 3) }
  let(:movie_id_first) { movies.first.id }
  let(:movie_id_last) { movies.last.id }
  let!(:favorite1) { create(:favorite, user_id: user.id, movie_id: movies[0].id)}
  let!(:favorite2) { create(:favorite, user_id: user.id, movie_id: movies[1].id)}
  let(:headers) { valid_headers }

  describe "GET /favorites" do
    before { get "/favorites", params: {}, headers: headers   }

    context 'when favorite exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all favorite items' do
        expect(json.size).to eq(2)
      end
    end
  end

  describe "GET /users/:id/favorites" do
    before { get "/user/#{user.id}/favorites", params: {}, headers: headers   }

    context 'when favorite exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all favorite items' do
        expect(json.size).to eq(2)
      end
    end
  end
end
