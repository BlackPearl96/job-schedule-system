# frozen_string_literal: true

module Admin
  class NotificationsController < BaseController
    before_action :load_notification, only: %i[update]

    def update
      @notification.seen!
      respond_to do |format|
        format.js
      end
    end

    private

    def load_notification
      @notification = Notification.find_by id: params[:id]
      return if @notification

      redirect_to request.referer, danger: t(".notify_not_found")
    end
  end
end
