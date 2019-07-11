# frozen_string_literal: true

RSpec.describe V1::Tasks::Operation::Index do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }

  describe 'Success' do
    let!(:task) { create(:task) }

    context 'without any filters' do
      let(:params) { {} }
      let!(:user_tasks) { create_list(:task, 2, user: user) }

      it 'returns all the users tasks' do
        expect(result[:errors]).to be_nil
        expect(result[:model]).to eq user_tasks
        expect(result[:model]).not_to include(task)
        expect(result).to be_success
      end
    end

    context 'with filter by done' do
      let(:params) { { done: true } }
      let!(:user_task) { create(:task, user: user) }
      let!(:done_user_tasks) { create_list(:task, 2, user: user, done: true) }

      it 'returns only users tasks with done status' do
        expect(result[:errors]).to be_nil
        expect(result[:model]).to eq done_user_tasks
        expect(result[:model]).not_to include(task)
        expect(result[:model]).not_to include(user_task)
        expect(result).to be_success
      end
    end

    context 'with filter by important' do
      let(:params) { { important: true } }
      let!(:user_task) { create(:task, user: user) }
      let!(:important_user_tasks) { create_list(:task, 2, user: user, important: true) }

      it 'returns only important users tasks' do
        expect(result[:errors]).to be_nil
        expect(result[:model]).to eq important_user_tasks
        expect(result[:model]).not_to include(task)
        expect(result[:model]).not_to include(user_task)
        expect(result).to be_success
      end
    end
  end

  describe 'Fail' do
    context 'when filter params has invalid types' do
      let(:params) { { important: 'who knows', done: 2 } }
      let(:errors) do
        {
          important: ['must be boolean'],
          done: ['must be boolean']
        }
      end

      include_examples 'has validation errors'
    end
  end
end
