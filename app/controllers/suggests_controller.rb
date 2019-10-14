# frozen_string_literal: true

class SuggestsController < ApplicationController
  def create
    @suggest = current_user.suggests.build suggest_params
    @suggest.save
    import_notification(@suggest)
    NotificationBroadcastJob.perform_later(current_user, @suggest.notifications.reverse)
    respond_to do |format|
      format.js
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :content
  end

  def import_notification(suggest)
    Notification.import!(%i[user_id suggest_id], User.admin.ids.map { |id| [id, suggest.id] })
  end
end
