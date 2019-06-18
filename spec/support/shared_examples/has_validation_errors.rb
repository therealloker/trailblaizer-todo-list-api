# frozen_string_literal: true

RSpec.shared_examples 'has validation errors' do
  it 'has validation errors' do
    expect(result).to be_failure
    error_messages = result['contract.default'] ? result['contract.default'].errors.messages : result[:errors]
    expect(errors).to match(error_messages)
  end
end
