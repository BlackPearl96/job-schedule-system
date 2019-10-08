class RealtimeChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def status_user
    current_user.toggle!(:online)
    stream_from("realtime_channel") if current_user.online
    ActionCable.server.broadcast "realtime_channel",
                                 user_id: current_user.id,
                                 online: current_user.online
  end
end
