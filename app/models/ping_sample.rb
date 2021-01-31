# frozen_string_literal: true

class PingSample < ApplicationRecord
  belongs_to :user
  validates :ping, presence: true
end
