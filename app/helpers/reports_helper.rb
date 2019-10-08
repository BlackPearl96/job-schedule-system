# frozen_string_literal: true

module ReportsHelper
  URI = ENV['uri_slack']

  def call_api_slack(channel)
    send_slack_notification(["```#{params[:reports]}```"].join, channel)
  end

  def report_api
    @reports.map { |r| [
                        "<b>Name</b>: #{r.task.title}<br>",
                        "<b>Permission</b>: #{r.task.color}<br>",
                        "<b>Start</b>: #{r.task.start}<br>",
                        "<b>End</b>: #{r.task.end}<br>", "<br>"
                        ] }.join("\n")
  end

  private

  def send_slack_notification(message, channel)
    return if message.blank?

    eac = ExternalApiCaller.new
    eac.call URI,
             username: current_user.username.to_s,
             text: message,
             channel: channel.to_s,
             icon_url: current_user.image.to_s
  end
end
