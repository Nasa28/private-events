class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, confirmation: true
end
