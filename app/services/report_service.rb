class ReportService
  class << self
    def send_report(params)
      ActiveRecord::Base.transaction do
        ChannelSlack.find_or_create_by(name: params[:channel])
        # reports.update(status: :done)
      end
    rescue Exception
      false
    end
  end
end
