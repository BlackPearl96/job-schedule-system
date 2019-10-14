# frozen_string_literal: true

class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  def self.search(search)
    where("lower(chatrooms.name) LIKE :search", search: "%#{search}%").distinct
  end
end
