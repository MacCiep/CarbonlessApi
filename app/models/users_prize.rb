class UsersPrize < ApplicationRecord
  belongs_to :prize
  belongs_to :user
end
