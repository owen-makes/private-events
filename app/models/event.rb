class Event < ApplicationRecord
  has_rich_text :description
  belongs_to :host, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User", through: "events_users"

  validates :name, :description, :date, :location, presence: :true
end
