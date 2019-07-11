# frozen_string_literal: true

RSpec.describe V1::Tasks::Operation::Index do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let!(:other_users_task) { create(:task) }

  describe 'Success' do
    context 'without any filters' do
      let!(:user_tasks) { create_list(:task, 2, user: user) }
      let(:params) { {} }

      it 'returns all the users tasks' do
        expect(result[:errors]).to be_nil
        expect(result[:model]).to eq user_tasks
        expect(result[:model]).not_to include(other_users_task)
        expect(result).to be_success
      end
    end

    context 'with filter by done' do
      it 'returns only users tasks with done status' do
        expect(result[:errors]).to be_nil
        expect(result[:model]).to eq user_tasks
        expect(result[:model]).not_to include(other_users_task)
        expect(result).to be_success
      end
    end

    context 'with filter by important' do
      it 'returns only users tasks with status' do
      end
    end
  end

  describe 'Fail' do
  end
end
