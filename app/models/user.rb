class User < ApplicationRecord
  has_many :groups, through: :members
  has_many :members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
