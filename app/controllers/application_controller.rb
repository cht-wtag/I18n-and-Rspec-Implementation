class ApplicationController < ActionController::Base
 # protect_from_forgery with: :exception
# check_authorization
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || extract_locale_from_tld || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  def default_url_options
    { locale: I18n.locale }
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
