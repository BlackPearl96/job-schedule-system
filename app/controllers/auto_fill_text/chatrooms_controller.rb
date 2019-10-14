# frozen_string_literal: true

module AutoFillText
  class ChatroomsController < ApplicationController
    def index
      @chatroom = Chatroom.public_channels.where("name like '%#{params[:term]}%'").collect(&:name)
      render json: @chatroom.uniq.sort
    end
  end
end
