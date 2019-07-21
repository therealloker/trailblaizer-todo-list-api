# frozen_string_literal: true

RSpec.describe V1::Tasks::Operation::Update do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:task) { create(:task, name: 'get rest', user: user) }
  let(:valid_params) do
    {
      id: task.id,
      name: 'make test',
      important: 'true',
      done: '1'
    }
  end

  describe 'Success' do
    let(:params) { valid_params }

    context 'when params are valid' do
      it 'updates the task name' do
        expect {
          result
          task.reload
        }.to change(task, :name).from('get rest').to('make test')
        expect(result[:errors]).to be_nil
        expect(result[:model]).to be_persisted
        expect(result).to be_success
      end

      it 'updates the task done status' do
        expect {
          result
          task.reload
        }.to change(task, :done).from(false).to(true)
        expect(result[:errors]).to be_nil
        expect(result[:model]).to be_persisted
        expect(result).to be_success
      end

      it 'updates the task important status' do
        expect {
          result
          task.reload
        }.to change(task, :important).from(false).to(true)
        expect(result[:errors]).to be_nil
        expect(result[:model]).to be_persisted
        expect(result).to be_success
      end
    end
  end

  describe 'Fail' do
    context 'when name is empty' do
      let(:params) do
        {
          id: task.id,
          name: ''
        }
      end

      let(:errors) do
        {
          name: ['must be filled']
        }
      end

      include_examples 'has validation errors'
    end

    context 'when name is not unique' do
      let(:errors) do
        {
          name: ['You already have a task with such name']
        }
      end

      let(:params) { valid_params }

      before { create(:task, name: params[:name], user: user) }

      include_examples 'has validation errors'
    end

    context 'when keys has incorrect types' do
      let(:errors) { { important: ['must be boolean'], done: ['must be boolean'] } }
      let(:params) do
        {
          id: task.id,
          name: valid_params[:name],
          important: 'who knows',
          done: 'no('
        }
      end

      include_examples 'has validation errors'
    end
  end
end
