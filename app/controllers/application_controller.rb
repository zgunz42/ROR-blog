class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :pages

  def pages
    @pages = {
        :home => root_path,
        :articles => posts_path,
        :projects => projects_path,
        :contacts => contact_forms_path
    }
  end
end
