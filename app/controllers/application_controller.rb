class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_language

  def set_language
    settings = Setting.first
    if settings.present?
      local = settings.language
    else
      local = I18n.default_locale
    end
    I18n.locale = local
  end
end
