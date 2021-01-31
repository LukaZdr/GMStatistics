# frozen_string_literal: true

class GameSession < ApplicationRecord
  belongs_to :map
  has_many :rounds
end
