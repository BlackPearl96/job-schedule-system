# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :task, -> { with_deleted }
  belongs_to :user

  scope :undon_report, ->(task_ids) { where task_id: task_ids }
  enum status: {doing: 0, done: 1}
end
