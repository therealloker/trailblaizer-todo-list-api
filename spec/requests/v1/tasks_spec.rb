# frozen_string_literal: true

RSpec.describe 'V1::Tasks API', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe 'GET /api/projects/:id/tasks' do
    include Docs::V1::Tasks::Index::Api
    include Docs::V1::Tasks::Index::List

    context 'valid request' do
      before do
        create_list(:task, 2, project: project)
        get "/api/projects/#{project.id}/tasks", headers: valid_token_headers(user.id)
      end

      it 'response tasks success', :dox do
        expect(response).to be_successful
      end

      it 'returns tasks list' do
        expect(response).to match_json_schema('task/index')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { get "/api/projects/#{project.id}/tasks", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'project does not relate to the user' do
        let(:project) { create(:project) }

        before { get "/api/projects/#{project.id}/tasks", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'POST /api/projects/:id/tasks' do
    include Docs::V1::Tasks::Create::Api
    include Docs::V1::Tasks::Create::Create

    let!(:valid_attributes) { attributes_for(:task).to_json }

    context 'valid request' do
      before do
        post "/api/projects/#{project.id}/tasks", params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'task created success', :dox do
        expect(response).to be_created
      end

      it 'returns a new task' do
        expect(response).to match_json_schema('task/create')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before do
          post "/api/projects/#{project.id}/tasks", params: valid_attributes, headers: invalid_token_headers(user.id)
        end

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before do
          post "/api/projects/#{project.id}/tasks", params: invalid_attributes, headers: valid_token_headers(user.id)
        end

        it 'creating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'project does not relate to the user' do
        let(:project) { create(:project) }

        before do
          post "/api/projects/#{project.id}/tasks", params: valid_attributes, headers: valid_token_headers(user.id)
        end

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'GET /api/tasks/:id' do
    include Docs::V1::Tasks::Show::Api
    include Docs::V1::Tasks::Show::Get

    let(:task) { create(:task, project: project) }

    context 'valid request' do
      before do
        get "/api/tasks/#{task.id}", headers: valid_token_headers(user.id)
      end

      it 'gets task success', :dox do
        expect(response).to be_successful
      end

      it 'returns task' do
        expect(response).to match_json_schema('task/show')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { get "/api/tasks/#{task.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'task does not relate to the user' do
        let(:task) { create(:task) }

        before { get "/api/tasks/#{task.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'PATCH /api/tasks/:id' do
    include Docs::V1::Tasks::Update::Api
    include Docs::V1::Tasks::Update::Update

    let(:task) { create(:task, project: project) }
    let(:valid_attributes) { attributes_for(:task).to_json }

    context 'valid request' do
      before do
        patch "/api/tasks/#{task.id}", params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'task update success', :dox do
        expect(response).to be_successful
      end

      it 'returns the updated task' do
        expect(response).to match_json_schema('task/show')
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { patch "/api/tasks/#{task.id}", params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before { patch "/api/tasks/#{task.id}", params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'updating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'task does not relate to user' do
        let(:task) { create(:task) }

        before { patch "/api/tasks/#{task.id}", params: valid_attributes, headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'DELETE /api/projects/:id' do
    include Docs::V1::Tasks::Destroy::Api
    include Docs::V1::Tasks::Destroy::Delete

    let(:task) { create(:task, project: project) }

    context 'valid request' do
      before do
        delete "/api/tasks/#{task.id}", headers: valid_token_headers(user.id)
      end

      it 'project delete success', :dox do
        expect(response).to have_http_status :no_content
      end
    end

    context 'invalid request' do
      context 'invalid token' do
        before { delete "/api/tasks/#{task.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'task does not relate to user' do
        let(:task) { create(:task) }

        before { delete "/api/tasks/#{task.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end
end
