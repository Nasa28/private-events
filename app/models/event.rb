class Event < ApplicationRecord
  validates :description, presence: true, length: { in: 1..250 }
  validates :date, presence: true
  
  belongs_to :creator, class_name: "User"
  has_many :attendable_events, foreign_key: "attended_event_id", dependent: :destroy
	has_many :attendees, through: :attendable_events, source: :event_attendee


  private
	def event_date_cannot_be_in_the_past
		if event_date && event_date < Date.today
			errors.add(:event_date, "can't be in the past")
		end
	end
end
