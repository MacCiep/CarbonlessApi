class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenyList

  validates :name, :lastname, presence: true
  has_many :history_points
  has_one :travel_session
  has_many :users_prizes
  has_many :prizes, through: :users_prizes
  has_many :achievements, through: :users_achievements
end
