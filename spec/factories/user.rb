# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    steam_id { Faker::Code.npi }
  end
end