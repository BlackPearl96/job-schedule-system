# frozen_string_literal: true

class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user, notifications)
    notifications.each do |notification|
      ActionCable.server.broadcast "notification_channel_#{notification.user_id}",
                                   content: render_user_suggest(user), user_id: user.id,
                                   notification: render_notification(notification),
                                   counter: Notification.where(user_id: notification.user_id).not_seen.size
    end
  end

  def render_user_suggest(user)
    ApplicationController.render partial: "admin/users/user", locals: { user: user }
  end

  def render_notification(notification)
    ApplicationController.renderer.render(partial: "admin/notifications/notification",
                                          locals: { notification: notification })
  end
end
