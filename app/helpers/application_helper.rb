# frozen_string_literal: true

module ApplicationHelper
  def online_status(user)
    content_tag :span, user.username, class: "user-#{user.id} online_status #{'online' if user.online?}"
  end

  def present_authorization?(chatroom)
    chatroom.users.ids.include?(current_user.id)
  end

  def admin_or_leader?
    !current_user.user?
  end

  def strftimes(message)
    message.created_at.localtime.strftime("%I:%M %p")
  end

  def count_user_chatrooms(chatroom)
    ChatroomUser.where(chatroom_id: chatroom.id).count
  end

  def message_present(user)
    user.messages.where(chatroom_id: @chatroom.id).exists?
  end

  def last_message(user)
    user.messages.where(chatroom_id: @chatroom.id).last&.body
  end

  def load_direct_message_rooms
    current_user.chatrooms.direct_messages.includes(:users)
  end
end
