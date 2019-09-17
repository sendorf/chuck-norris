# frozen_string_literal: true

# App controller
class ApplicationController < ActionController::Base
  before_action :check_categories
  around_action :switch_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private
 
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def check_categories
    Connector::ChuckNorris.categories if Category.count.zero?
  end
end
