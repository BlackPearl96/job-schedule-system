# frozen_string_literal: true

class SuggestsController < ApplicationController
  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
       ActionCable.server.broadcast "messages",
        message: message.content,
        user: message.user.username
      head :ok
      respond_to do |format|
        format.js
      end
    end


  end

  private

  def suggest_params
    params.require(:suggest).permit :content
  end
end
