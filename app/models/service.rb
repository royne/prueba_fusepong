class Service < ApplicationRecord
  validates :origin, :destination, presence: true

  belongs_to :user
end
