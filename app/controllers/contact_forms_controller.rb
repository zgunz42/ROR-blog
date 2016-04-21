class ContactFormsController < ApplicationController
  before_action :setup, only: [:index, :new]

  def index
    render :new
  end
  def new

  end
  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request

    if @contact.deliver
      flash.now[:error] = nil
      @user = params[:contact_form][:email]
    else
      flash.now[:error] = "cannot render message"
      render :new
    end
  end
  private
  def setup
    @contact = ContactForm.new
  end
end

