# frozen_string_literal: true

FactoryBot.define do
  factory :login_time do
    user { create(:user) }
    login { DateTime.now }
    logout { nil }
    logout_reason { nil }
  end
end
