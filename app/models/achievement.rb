class Achievement < ApplicationRecord
  has_many :users, through: :user_achievements

  validates_presence_of :title

  enum type: {
    carbon: 0,
    travel: 1,
    longest_route: 2
  }
end
