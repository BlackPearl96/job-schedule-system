# frozen_string_literal: true

module AutoFillText
  class UsersController < ApplicationController
    def index
      @users = User.where("username like '%#{params[:term]}%'").map { |i| { label: i[:username], value: i[:id] } }
      render json: @users
    end
  end
end
