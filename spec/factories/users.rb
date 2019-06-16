# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "test-email#{n}@email.com"
    end
    password { 'Password1' }
  end
end
