class Event < ApplicationRecord
  validates :description, presence: true, length: { maximum: 250 }
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :attendable_events, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :attendable_events, source: :event_attendee

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date >= ?', DateTime.now) }
end
