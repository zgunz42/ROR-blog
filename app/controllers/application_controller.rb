class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  load_and_authorize_resource find_by: :slug
  protect_from_forgery with: :exception
  before_action :pages

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def pages
    @pages = {
        :home => root_path,
        :articles => posts_path,
        :projects => projects_path,
        :contacts => contact_forms_path
    }
  end
end
