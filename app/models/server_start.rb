# frozen_string_literal: true

class ServerStart < ApplicationRecord
  validates :time, presence: true
end
