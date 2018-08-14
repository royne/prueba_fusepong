class Asignation < ApplicationRecord
  rolify
  belongs_to :service
  belongs_to :user
end
