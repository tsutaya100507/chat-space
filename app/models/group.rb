class Group < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :members
  has_many :members
end
