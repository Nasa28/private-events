class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
  
  has_many :attendable_events, foreign_key: "event_attendee_id", dependent: :destroy
	has_many :attended_events, through: :attendable_events
end
