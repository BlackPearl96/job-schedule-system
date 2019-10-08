# frozen_string_literal: true

class ChannelSlack < ApplicationRecord
  validates :name, uniqueness: false
  validates :name, presence: true
end
