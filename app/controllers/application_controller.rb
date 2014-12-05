class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  private
  def set_locale
    locale = params[:locale]
    if locale.present? and I18n.available_locales.include? locale.to_sym
      I18n.locale = locale
    else
      I18n.locale = http_accept_language.language_region_compatible_from(I18n.available_locales)
    end
    puts "Locale would be #{I18n.locale}"
  end
end
