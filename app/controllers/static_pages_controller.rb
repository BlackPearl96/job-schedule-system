# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @working = current_user.workings.last
    @suggest = current_user.suggests.last
    return if @suggest && @suggest.created_at.to_date == Time.now.to_date

    @suggest = nil
  end
end
