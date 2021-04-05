class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attended_events, through: :attendances, source: :attended_event
  has_many :attendances, foreign_key: "attendee_id"
end
