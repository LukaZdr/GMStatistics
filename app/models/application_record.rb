# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.epoch_to_datetime(epoch)
    DateTime.strptime(epoch.to_s, '%s')
  end
end
