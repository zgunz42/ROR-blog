class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # never put load_and_authorize_resource this make crazy !
  protect_from_forgery with: :exception
  helper_method :current_or_guest_user
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
  protect_from_forgery
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id]!=current_user.id
        logging_in
        #reload guest_user to prevent caching problems before destruction
        guest_user(with_retry=false).reload.try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end
  def guest_user(with_retry= true)
    @cached_guest_user||= User.find(session[:guest_user_id]||=create_guest_user.id)

  rescue
    ActiveRecord::RecordNotFound
    session[:guest_user_id] = nil
    guest_user if with_retry
  end
  private
  def logging_in

  end
  def create_guest_user
    u = User.create(username: "guest", email: "guest_#{Time.now.to_i}#{rand(100)}@zgunzdev.com")
    u.save(:validate => false)
    session[:guest_user_id] = u.id
    u
  end
end
