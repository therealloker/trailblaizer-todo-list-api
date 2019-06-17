# frozen_string_literal: true

RSpec.describe Api::DocSelectorService do
  describe '.call' do
    let(:version) { FFaker::Internet.domain_word }

    it 'returns pathname instance' do
      expect(described_class.call(version)).to be_an_instance_of(Pathname)
    end

    it do
      expect(described_class.call(version).to_s).to match(%r{docs/#{version}.html})
    end
  end
end
