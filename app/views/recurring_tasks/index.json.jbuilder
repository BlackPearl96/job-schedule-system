# frozen_string_literal: true

json.partial! @recurring_tasks,
              partial: "recurring_tasks/recurring_task",
              as: :recurring_task
