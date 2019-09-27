# frozen_string_literal: true
class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  scope :public_channels, -> { where(direct_message: false) }
  scope :direct_messages, -> { where(direct_message: true) }

  def self.direct_message_for_users(users)
    username = users.map(&:username).sort
    name = "Conversation:#{username.join(":")}"
    chatroom = direct_messages.find_by(name: name) || create_room(name)
  end

  private

  def self.create_room(name)
    chatroom = create(name: name, direct_message: true)
  end
end
