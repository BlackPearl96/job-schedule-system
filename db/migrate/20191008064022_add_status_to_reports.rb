class AddStatusToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :status, :integer, default: 0
  end
end
