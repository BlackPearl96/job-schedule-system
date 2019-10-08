# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @channels = ChannelSlack.all
    @rows = current_user.reports.includes(:task, :user).doing.select { |report| report.created_at.to_date == Date.today }
    @reports = Kaminari.paginate_array(@rows).page(params[:page]).per(5)
  end

  def create
    @reports = current_user.reports.where("created_at >= ?", Time.now.beginning_of_day)
    # SendEmailJob.delay(run_at: 10.seconds.from_now).perform_later(current_user)
    if ReportService.send_report(params)
      call_api_slack params[:channel]
      redirect_to reports_path, success: "send report success"
    else
      redirect_to reports_path, warning: "can not send report"
    end
  end
end
