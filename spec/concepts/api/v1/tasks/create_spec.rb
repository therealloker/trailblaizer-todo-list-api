# frozen_string_literal: true

RSpec.describe V1::Tasks::Operation::Create do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:task) { build(:task) }
  let(:valid_params) do
    {
      name: task.name,
      important: 'true'
    }
  end

  describe 'Success' do
    let(:params) { valid_params }

    it 'creates task' do
      expect { result }.to change(Task, :count).from(0).to(1)
      expect(result[:errors]).to be_nil
      expect(result[:model]).to be_persisted
      expect(result[:model].user_id).to eq user.id
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'when name is empty' do
      let(:params) { {} }
      let(:errors) do
        {
          name: ['must be filled']
        }
      end

      include_examples 'has validation errors'
    end

    context 'when keys has incorrect types' do
      let(:errors) { { important: ['must be boolean'], done: ['must be boolean'] } }
      let(:params) { { name: task.name, important: 'yes!', done: 'no(' } }

      include_examples 'has validation errors'
    end
  end
end
