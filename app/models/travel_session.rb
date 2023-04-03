class TravelSession < ApplicationRecord
  belongs_to :user

  enum travel_tool: {
    'bus': 0,
    'train': 1,
    'bike': 2,
    'tram': 3,
    'metro': 4
  }

  validates :travel_tool, presence: true
end
