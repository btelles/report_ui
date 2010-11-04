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

  expose(:available_columns) { report.available_columns }

  def create
    report = Report.new(params[:report])

    if report.save
      flash[:notice] = 'Report was successfully created.'
      redirect_to(report)
    else
      render :action => "new"
    end
  end
end
