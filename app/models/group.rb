class Group < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :members
  has_many :members
  has_many :messages


  def latest_messages(group)
    if group.messages.last.try(:message).present?
      group.messages.last.try(:message)
    elsif group.messages.last.try(:image).present?
       "画像が投稿されました。"
    else
       "まだ投稿がありません。"
    end
  end

end
