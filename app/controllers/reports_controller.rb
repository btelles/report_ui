class ReportsController < ApplicationController
  expose :report
  expose(:reports) { Report.all }
  expose(:custom_reports) do
    if respond_to?(:current_user) && current_user.respond_to?(:reports)
      current_user.reports
    else
      []
    end
  end

  def columns
    @available_columns = report.available_columns
  end
end
