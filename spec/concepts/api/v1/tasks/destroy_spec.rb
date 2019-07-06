# frozen_string_literal: true

RSpec.describe V1::Tasks::Operation::Destroy do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:valid_task) { create(:task, user: user) }
  let(:params) do
    {
      id: task.id
    }
  end

  describe 'Success' do
    context 'when the task relate to the user' do
      let(:task) { valid_task }

      it 'destroys the task' do
        expect(result['result.policy.default']).to be_success
        expect(result[:errors]).to be_nil
        expect(result[:model]).to be_destroyed
        expect(result).to be_success
      end
    end
  end

  describe 'Fail' do
    context 'when the task does not relate to the user' do
      let(:task) { create(:task) }

      it 'does not destroy the task' do
        expect(result['result.policy.default']).to be_failure
        expect(result).to be_failure
      end
    end
  end
end
