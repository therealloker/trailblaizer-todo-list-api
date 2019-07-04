# frozen_string_literal: true

RSpec.describe 'V1::Projects API', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe 'GET /api/projects' do
    include Docs::V1::Projects::Index::Api
    include Docs::V1::Projects::Index::List

    context 'valid request' do
      before do
        create_list(:project, 2, user: user)
        get '/api/projects', headers: valid_token_headers(user.id)
      end

      it 'response projects success', :dox do
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

  describe 'GET /api/projects/:id' do
    include Docs::V1::Projects::Show::Api
    include Docs::V1::Projects::Show::Get

    context 'valid request' do
      before do
        get "/api/projects/#{project.id}", headers: valid_token_headers(user.id)
      end

      it 'gets a project success', :dox do
        expect(response).to be_successful
      end

      it 'returns project' do
        expect(response).to match_json_schema('project/show')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { get "/api/projects/#{project.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'not users project' do
        let(:another_project) { create(:project) }

        before { get "/api/projects/#{another_project.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'PATCH /api/projects/:id' do
    include Docs::V1::Projects::Update::Api
    include Docs::V1::Projects::Update::Update

    let!(:valid_attributes) { attributes_for(:project).to_json }

    context 'valid request' do
      before do
        patch "/api/projects/#{project.id}", params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'project update success', :dox do
        expect(response).to be_successful
      end

      it 'updates a new project' do
        expect(response).to match_json_schema('project/show')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { patch "/api/projects/#{project.id}", params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before { patch "/api/projects/#{project.id}", params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'updating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'project does not relate to user' do
        let(:project) { create(:project) }

        before { patch "/api/projects/#{project.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'PATCH /api/projects/:id' do
    include Docs::V1::Projects::Destroy::Api
    include Docs::V1::Projects::Destroy::Delete

    context 'valid request' do
      before do
        delete "/api/projects/#{project.id}", headers: valid_token_headers(user.id)
      end

      it 'project delete success', :dox do
        expect(response).to have_http_status :no_content
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { delete "/api/projects/#{project.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'not users project' do
        let(:another_project) { create(:project) }

        before { delete "/api/projects/#{another_project.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end
end
