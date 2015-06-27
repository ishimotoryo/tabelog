class User < ActiveRecord::Base
  has_many :reviews
  has_many :omises, through: :reviews
  validates :user_name, length: { maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
