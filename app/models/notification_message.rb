class NotificationMessage < ApplicationRecord
  belongs_to :message
  belongs_to :user

  enum status: %i[not_seen seen]

  scope :by_status, -> { order status: :asc }
  scope :newest, -> { order created_at: :desc }
end
