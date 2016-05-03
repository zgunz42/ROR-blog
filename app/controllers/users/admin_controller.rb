class Users::AdminController < ApplicationController
  before_action :current_is_admin
  def index

  end

  private
  def current_is_admin
    unless current_or_guest_user.has_role? :admin
      redirect_to root_path, warning: 'your not has admin access!'
    end

  end

end
