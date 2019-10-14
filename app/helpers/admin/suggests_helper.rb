# frozen_string_literal: true

module Admin
  module SuggestsHelper
    URI = ENV["uri_slack"]

    def call_api_slack(suggest)
      send_slack_notification(["```
        ID: ##{suggest.id}\n
        Name: #{suggest.user.username}\n
        Email: #{suggest.user.email}\n
        Content: #{suggest.content}\n
        Date: #{suggest.created_at.localtime.to_date}\n
        Status: #{suggest.status}```"].join)
    end

    private

    def send_slack_notification(message)
      return if message.blank?

      eac = ExternalApiCaller.new
      eac.call URI,
               username: current_user.username.to_s,
               text: message,
               channel: "am-nhac-ruby",
               icon_url: current_user.image.to_s
    end
  end
end
