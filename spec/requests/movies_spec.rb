require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let!(:user) { create(:user) }
  let!(:movies) { create_list(:movie, 9) }
  let!(:movie) { create(:movie, uid: 98171) } #Shao Lin yu ren zhe
  let(:movie_id) { movie.id }
  let(:movie_uid) { movie.uid }
  let(:headers) { valid_headers }

  describe 'GET /movies' do
    before { get '/movies', params: {}, headers: headers  }

    it 'returns movies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies/:id' do
    before { get "/movies/#{movie_uid}", params: {}, headers: headers  }

    context 'when the record exists' do
      it 'returns the movie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(movie_uid)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:movie_uid) { 1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end

end
