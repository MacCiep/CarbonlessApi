class HistoryPoint < ApplicationRecord
  belongs_to :user

  enum history_type: {
    'travel': 0,
    'purchase': 1
  }

  enum category: {
    'bus': 0,
    'train': 1,
    'bike': 2,
    'tram': 3,
    'metro': 4,
    'food': 5,
    'clothes': 6
  }

  validates :history_type, :category, presence: true
end
