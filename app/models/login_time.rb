# frozen_string_literal: true

class LoginTime < ApplicationRecord
  validates :login, presence: true
  belongs_to :user
end
