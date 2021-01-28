class LoginTime < ApplicationRecord
  validates :time, presence: true
  belongs_to :user
end
