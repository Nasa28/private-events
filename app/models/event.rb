class Event < ApplicationRecord
  validates :description, presence: true, length: { in: 1..250 }
  belongs_to :creator, class_name: "User"
  validates :date, presence: true
  has_many :attendees, class_name: "User"
end
