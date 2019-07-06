# frozen_string_literal: true

RSpec.describe V1::Users::Operation::Register do
  subject(:result) { described_class.call(params: params) }

  let(:user) { build(:user) }
  let(:valid_params) do
    {
      email: user.email,
      password: user.password,
      password_confirmation: user.password
    }
  end

  describe 'Success' do
    let(:params) { valid_params }

    it 'creates user' do
      expect { result }.to change(User, :count).from(0).to(1)
      expect(result[:errors]).to be_nil
      expect(result[:model]).to be_persisted
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'when keys are empty' do
      let(:params) { {} }
      let(:errors) do
        {
          email: ['must be filled'],
          password: ['must be filled', 'size cannot be less than 8']
        }
      end

      include_examples 'has validation errors'
    end

    context 'when passwords are different' do
      let(:params) { valid_params.merge(password_confirmation: '') }
      let(:errors) { { password_confirmation: ['must be equal to Password1'] } }

      include_examples 'has validation errors'
    end

    context 'when email already exists' do
      let(:existing_user) { create(:user) }
      let(:params) { valid_params.merge(email: existing_user.email) }
      let(:errors) { { email: ['Email already been taken'] } }

      include_examples 'has validation errors'
    end
  end
end
