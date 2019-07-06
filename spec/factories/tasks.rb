# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.unique.word }
    done { false }
    important { false }
    user
  end
end
