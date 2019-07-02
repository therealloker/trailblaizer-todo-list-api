# frozen_string_literal: true

RSpec.describe 'V1::Users API', type: :request do
  let(:user) { create(:user) }

  describe 'GET /api/projects' do
    include Docs::V1::Projects::Index::Api
    include Docs::V1::Projects::Index::List

    context 'valid request' do
      before do
        create_list(:project, 2, user: user)
        get '/api/projects', headers: valid_token_headers(user.id)
      end

      it 'gets projects success', :dox do
        expect(response).to be_successful
      end

      it 'returns projects list' do
        expect(response).to match_json_schema('project/index')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { get '/api/projects', headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end

  describe 'POST /api/projects' do
    include Docs::V1::Projects::Create::Api
    include Docs::V1::Projects::Create::Create

    let!(:valid_attributes) { attributes_for(:project).to_json }

    context 'valid request' do
      before do
        post '/api/projects', params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'project create success', :dox do
        expect(response).to be_created
      end

      it 'creates a new project' do
        expect(response).to match_json_schema('project/create')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { post '/api/projects', params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before { post '/api/projects', params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'creating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end

    describe 'POST /api/projects' do
    include Docs::V1::Projects::Create::Api
    include Docs::V1::Projects::Create::Create

    let(:user) { create(:user) }
    let!(:valid_attributes) { attributes_for(:project).to_json }

    context 'valid request' do
      before do
        post '/api/projects', params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'project create success', :dox do
        expect(response).to be_created
      end

      it 'creates a new project' do
        expect(response).to match_json_schema('project/create')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { post '/api/projects', params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before { post '/api/projects', params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'creating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end
end
