# frozen_string_literal: true

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:user) }
end
