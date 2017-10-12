class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :message_or_image, presence: true

  private
   def message_or_image
    message.presence or image.presence
  end
end
