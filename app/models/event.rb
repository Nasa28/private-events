class Event < ApplicationRecord
  validates :description, presence: true, length: { in: 1..250 }
  validates :date, presence: true
  
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances, source: :attendee
end
