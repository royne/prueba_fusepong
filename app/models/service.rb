class Service < ApplicationRecord
  validates :origin, :destination, presence: true
  resourcify

  belongs_to :user
  belongs_to :asignation, optional: true
end
