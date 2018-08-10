class Service < ApplicationRecord
  validates :origin, :destination, presence: true
end
