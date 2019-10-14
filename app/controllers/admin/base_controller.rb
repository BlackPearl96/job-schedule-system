# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout "admin"
    before_action :check_admin_permission, :load_notifications

    include SuggestsHelper

    def check_admin_permission
      redirect_to root_path, notice: t(".not_admin") unless current_user.try :admin?
    end

    def load_notifications
      @notifications = current_user.notifications.by_status.newest
    end
  end
end
