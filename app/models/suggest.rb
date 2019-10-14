# frozen_string_literal: true

class Suggest < ApplicationRecord
  belongs_to :user
  has_many :notifications

  validates :content, presence: true
  enum status: { waiting: 0, approved: 1, rejected: 2 }
  scope :newest, -> { order created_at: :desc }
end
