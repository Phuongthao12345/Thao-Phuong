class ReportsController < ApplicationController
  before_action :new_notifications_count, :notifications_limit, only: [:new]

  def new
    @report = Report.new
  end

  def create
    @report = Report.new report_params
    if @report.save
      CreateNotificationService.new(target_id: @report.target_id, des_id: @report.des_id, target_type: "Reported", des_type: @report.des_type , url: @report.url).create_notification
      flash[:success] = "TC"
      respond_to do |format|
        format.html{redirect_to root_path}
        format.js
      end

    end
  end

  private

  def report_params
    params.require(:report).permit :content, :target_id, :des_id, :des_type, :url
  end
end
