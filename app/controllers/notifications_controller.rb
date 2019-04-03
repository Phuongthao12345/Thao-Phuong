class NotificationsController < ApplicationController

  def index
    if log_in?
      @notifications = current_user.notifications
    end
  end

  def show;  end

  def destroy
    find_notification
    @notification.destroy
    redirect_to post_path(@comment.post_id)
  end

  private
  def find_notification
    @notification = Notifications.find_by(id: params[:id]) if params[:id]
  end
end