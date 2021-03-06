class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CommentsHelper
  include NotificationsHelper
  before_action :set_locale
  before_action :check_log_in, :new_notifications_count, :notifications_limit

  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
      locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
