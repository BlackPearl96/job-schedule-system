# frozen_string_literal: true

class SuggestMailer < ApplicationMailer
  def suggest_confirm(suggest)
    @suggest = suggest
    mail to: @suggest.user.email, subject: "Send Mail Suggests"
  end
end
