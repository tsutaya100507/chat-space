class Group < ApplicationRecord
  # validate :add_error_sample

  # def add_error_sample
  #   if name.blank?
  #     errors[:base] << "商品名は必ず入力して下さい"
  #   end
  # end
  validates :name, presence: true
  has_many :users, through: :members
  has_many :members
end
