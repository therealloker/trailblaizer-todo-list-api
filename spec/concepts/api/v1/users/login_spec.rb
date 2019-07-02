# frozen_string_literal: true

RSpec.describe V1::Users::Operation::Login do
  subject(:result) { described_class.call(params: params) }

  let(:user) { create(:user) }

  describe 'Success' do
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    it 'generates new token for the user' do
      expect(result[:errors]).to be_nil
      expect(result[:jwt]).to be_present
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    let(:errors) { { user: ['You shall not pass'] } }

    context 'empty keys' do
      let(:params) { {} }
      let(:errors) do
        {
          email: ['must be filled'],
          password: ['must be filled']
        }
      end

      include_examples 'has validation errors'
    end

    context 'invalid email' do
      let(:params) do
        {
          email: 'itsmine@mail.com',
          password: user.password
        }
      end

      include_examples 'has validation errors'
    end

    context 'invalid password' do
      let(:params) do
        {
          email: user.email,
          password: 'idontknow'
        }
      end

      include_examples 'has validation errors'
    end
  end
end
