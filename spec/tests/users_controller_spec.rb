require 'rails_helper'

RSpec.describe 'User', type: :request do
  # Due to the fact that we don't have access to the session (due to devise authentication)
  # We will attempt to login during integration tests
  describe 'GET #index' do
    before(:example) { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:found)
    end
    it 'redirect to signin page' do
      expect(response).to redirect_to '/users/sign_in'
    end
  end
end
