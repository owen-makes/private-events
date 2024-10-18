class Event < ApplicationRecord
  has_rich_text :description
  belongs_to :host, class_name: "User"
  has_many :attendees, class_name: "User"

  validates :name, :description, :date, :location, presence: :true
end
