# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :notification_messages

  validates :body, presence: true

  delegate :username, to: :user
end
