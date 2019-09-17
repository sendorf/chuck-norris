# frozen_string_literal: true

# App controller
class ApplicationController < ActionController::Base
  before_action :check_categories

  def check_categories
    Connector::ChuckNorris.categories if Category.count.zero?
  end
end
