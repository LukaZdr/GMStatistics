class LoginTime < ApplicationRecord
  validates :login, presence: true
  belongs_to :user
end
