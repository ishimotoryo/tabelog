class Review < ActiveRecord::Base
  belongs_to :omise
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true}
  validates :body, presence: true

  # def retirieveIdByCurrentUser

  # end
end
