# frozen_string_literal: true

RSpec.describe 'V1::Users API', type: :request do
  describe 'POST /api/users/registration' do
    include Docs::V1::Users::Registrations::Api
    include Docs::V1::Users::Registrations::Signup

    let(:user) { build(:user) }
    let!(:valid_attributes) { attributes_for(:user, password_confirmation: user.password).to_json }

    context 'when request is valid' do
      before do
        post '/api/users/registration', params: valid_attributes, headers: default_header
      end

      it 'sign up success', :dox do
        expect(response).to be_created
      end

      it 'returns the created user' do
        expect(response).to match_json_schema('users/create')
      end
    end

    context 'when request is invalid' do
      before { post '/api/users/registration' }

      it 'sign up fails', :dox do
        expect(response).to be_unprocessable
      end

      it 'returns error' do
        expect(response).to match_json_schema('errors')
      end
    end
  end

  describe 'POST /api/users/login' do
    include Docs::V1::Users::Login::Api
    include Docs::V1::Users::Login::Signin

    context 'when request is valid' do
      let!(:user) { create(:user) }
      let(:valid_attributes) { { email: user.email, password: user.password }.to_json }

      before do
        post '/api/users/login', params: valid_attributes, headers: default_header
      end

      it 'sign in success', :dox do
        expect(response).to be_successful
      end

      it 'returns a new generated token for the user' do
        expect(response).to match_json_schema('users/login')
      end
    end

    context 'when request is invalid' do
      let(:invalid_attributes) { { email: 'buffalobill@mail.com', password: 'lambs123' }.to_json }

      before { post '/api/users/login', params: invalid_attributes, headers: default_header }

      it 'login fails', :dox do
        expect(response).to be_unprocessable
      end

      it 'returns error' do
        expect(response).to match_json_schema('errors')
      end
    end
  end
end
