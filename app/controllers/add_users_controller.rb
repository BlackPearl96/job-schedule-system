# frozen_string_literal: true

class AddUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user_chatroom, only: :create

  def index
  end

  def create
    if check_user_in?(@user)
      redirect_to @chatroom, danger: "#{@user.username} was already in #{@chatroom.name}"
    elsif !@user
      @users = User.all.where(username: params[:search_user])
      @chatroom = Chatroom.find(params[:chatroom_id])
      render "users/index"
    else
      @chatroom_user = ChatroomUser.find_or_create_by(user_id: @user.id, chatroom_id: @chatroom.id)
      redirect_to @chatroom, info: "You added successful #{@user.username} in #{@chatroom.name}"
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:chatroom_id])
    if @chatroom_user = @chatroom.chatroom_users.where(user_id: params[:user_id]).destroy_all
      ActionCable.server.broadcast "remove_user_channel",
        user_id: params[:user_id],
        chatroom_id: params[:chatroom_id]
    end
    redirect_to @chatroom
  end

  private

  def check_user_in?(user)
    if user
      @chatroom.users.ids.include?(user.id)
    end
  end

  def load_user_chatroom
    # return redirect_to request.referer, info: "Please typing any thing on search bar" unless params[:user_id].present?
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @chatroom = Chatroom.find(params[:chatroom_id])
    end
  end
end
