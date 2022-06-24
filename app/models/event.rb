# frozen_string_literal: true

class Event < ActiveRecord::Base
  validates :name, :date, :location, :description, presence: true

  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  belongs_to :creator, class_name: 'User'
end
