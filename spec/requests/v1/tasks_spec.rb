# frozen_string_literal: true

RSpec.describe 'V1::Tasks API', type: :request do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  describe 'GET /api/tasks' do
    include Docs::V1::Tasks::Index::Api
    include Docs::V1::Tasks::Index::List

    context 'when request is valid' do
      before do
        create_list(:task, 2, user: user)
        get '/api/tasks', headers: valid_token_headers(user.id)
      end

      it 'response success', :dox do
        expect(response).to be_successful
      end

      it 'returns tasks list' do
        expect(response).to match_json_schema('tasks/index')
      end
    end

    context 'when request is invalid' do
      context 'when token is invalid' do
        before { get '/api/tasks', headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end

  describe 'POST /api/tasks' do
    include Docs::V1::Tasks::Create::Api
    include Docs::V1::Tasks::Create::Create

    let!(:valid_attributes) { attributes_for(:task).to_json }

    context 'when request is valid' do
      before do
        post '/api/tasks', params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'response success', :dox do
        expect(response).to be_created
      end

      it 'returns the created task' do
        expect(response).to match_json_schema('tasks/show')
      end
    end

    context 'when request is invalid' do
      context 'when token is invalid' do
        before { post '/api/tasks', params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error message' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'when attributes are invalid' do
        let(:invalid_attributes) { { name: '' }.to_json }

        before { post '/api/tasks', params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'creating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error message' do
          expect(response).to match_json_schema('errors')
        end
      end
    end
  end

  describe 'GET /api/tasks/:id' do
    include Docs::V1::Tasks::Show::Api
    include Docs::V1::Tasks::Show::Get

    context 'when request is valid' do
      before do
        get "/api/tasks/#{task.id}", headers: valid_token_headers(user.id)
      end

      it 'response success', :dox do
        expect(response).to be_successful
      end

      it 'returns the task' do
        expect(response).to match_json_schema('tasks/show')
      end
    end

    context 'when request is invalid' do
      context 'when token is invalid' do
        before { get "/api/tasks/#{task.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error message' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'when task does not relate to the user' do
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

    let!(:valid_attributes) { attributes_for(:task).to_json }

    context 'when request is valid' do
      before do
        patch "/api/tasks/#{task.id}", params: valid_attributes, headers: valid_token_headers(user.id)
      end

      it 'response success', :dox do
        expect(response).to be_successful
      end

      it 'returns the updated task' do
        expect(response).to match_json_schema('tasks/show')
      end
    end

    context 'when request is invalid' do
      context 'when token is invalid' do
        before { patch "/api/tasks/#{task.id}", params: valid_attributes, headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'when attributes are invalid' do
        let(:invalid_attributes) { { name: '', done: 'no' }.to_json }

        before { patch "/api/tasks/#{task.id}", params: invalid_attributes, headers: valid_token_headers(user.id) }

        it 'updating fails', :dox do
          expect(response).to be_unprocessable
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'when the task does not relate to the user' do
        let(:task) { create(:task) }

        before { patch "/api/tasks/#{task.id}", params: valid_attributes, headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end

  describe 'DELETE /api/tasks/:id' do
    include Docs::V1::Tasks::Destroy::Api
    include Docs::V1::Tasks::Destroy::Delete

    context 'when request is valid' do
      before do
        delete "/api/tasks/#{task.id}", headers: valid_token_headers(user.id)
      end

      it 'response success', :dox do
        expect(response).to have_http_status :no_content
      end
    end

    context 'when request is invalid' do
      context 'when token is invalid' do
        before { delete "/api/tasks/#{task.id}", headers: invalid_token_headers(user.id) }

        it 'returns 401' do
          expect(response).to have_http_status :unauthorized
        end

        it 'returns error' do
          expect(response).to match_json_schema('errors')
        end
      end

      context 'when the task does not relate to the user' do
        let(:task) { create(:task) }

        before { delete "/api/tasks/#{task.id}", headers: valid_token_headers(user.id) }

        it 'returns 403' do
          expect(response).to have_http_status :forbidden
        end
      end
    end
  end
end
