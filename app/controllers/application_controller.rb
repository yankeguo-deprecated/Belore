class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_filter :check_user_exists

  private

  def set_locale
    locale = params[:locale]
    if locale.present? and I18n.available_locales.include? locale.to_sym
      I18n.locale = locale
    else
      I18n.locale = http_accept_language.language_region_compatible_from(I18n.available_locales)
    end
  end

  def check_user_exists
    if !$user_exists and User.count == 0
      if controller_name != 'registrations'
        redirect_to new_user_registration_path
      end
    else
      $user_exists = true
    end
  end
end
