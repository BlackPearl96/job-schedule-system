# frozen_string_literal: true

class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel_#{current_user.id}"
  end
end
