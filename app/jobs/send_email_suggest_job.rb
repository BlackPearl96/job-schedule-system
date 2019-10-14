# frozen_string_literal: true

class SendEmailSuggestJob < ApplicationJob
  queue_as :default

  def perform(suggest)
    @suggest = suggest
    SuggestMailer.suggest_confirm(@suggest).deliver
  end
end
