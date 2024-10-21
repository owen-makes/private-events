class Event < ApplicationRecord
  has_rich_text :description
  belongs_to :host, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User", through: "events_users"

  validates :name, :description, :date, :location, presence: :true

  # defined as scope
  scope :upcoming, -> { where("date > ?", Time.now) }

  # or defined as method (it's the same)
  def self.past
    where("date < ?", Time.now)
  end
end
