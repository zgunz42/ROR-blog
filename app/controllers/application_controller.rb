class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # never put load_and_authorize_resource this make crazy !
  protect_from_forgery with: :exception
  before_action :pages

  rescue_from CanCan::AccessDenied do |exception|
    flash[:status] = 'error'
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
