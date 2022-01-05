require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @new_user = User.create(username: 'someuser', status: 'online')
    @headers = { 'ACCEPT' => 'application/json' }
    @content_type = 'application/json; charset=utf-8'
  end
  describe 'Users requests' do
    it 'renders all the available users' do
      get '/users'
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to eq("[#{@new_user.to_json}]")
    end

    it 'creates a new user' do
      post '/users', params: { user: { username: 'someuser2', status: 'online' } }, headers: @headers
      expect(response.content_type).to eq(@content_type)
      expect(response).to have_http_status(:ok)
    end

    it 'add message' do
      expect(@new_user.messages.count).to eq(0)
      post "/users/#{@new_user.id}/add_message", params: { user_id: @new_user.id, message: 'a test msg' },
                                                 headers: @headers
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(@new_user.messages.count).to eq(1)
    end
  end
end
