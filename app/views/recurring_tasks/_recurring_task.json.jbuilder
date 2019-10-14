# frozen_string_literal: true

params[:limit] = recurring_task.limit.blank? ? 0 : recurring_task.limit
tasks = recurring_task.tasks(params[:start], Time.now.end_of_month + params[:limit].month)
json.array! tasks do |task|
  json.id "recurring_#{recurring_task.id}"
  json.title recurring_task.title
  json.start task.strftime("%Y-%m-%d")
  json.end (task + 1.day).strftime("%Y-%m-%d")
  json.limit recurring_task.limit

  json.color recurring_task.color unless recurring_task.color.blank?
  json.allDay true

  json.update_url recurring_task_path(recurring_task, method: :patch)
  json.edit_url edit_recurring_task_path(recurring_task)
end
