require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let!(:user) { create(:user) }
  let!(:movies) { create_list(:movie, 10) }
  let(:movie_id) { movies.first.id }
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
end
