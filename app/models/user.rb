class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :services

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end
end
