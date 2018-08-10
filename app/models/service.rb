class Service < ApplicationRecord
  validates :origin, :destination, presence: true
  resourcify

  belongs_to :user
end
