class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_sign_in

  def index
    @user = current_user
    @registered_applications = @user.registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by { |e| e.name }
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    @user = current_user
    @registered_application = @user.registered_applications.new(registered_application_params)
    if @registered_application.save
      flash.now[:notice] = "Your application was saved successfully!"
      redirect_to @registered_application
    else
      flash.now[:error] = "Your application was not saved, please try again."
      render :new
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)
    if @registered_application.save
      flash.now[:notice] = "Your application was updated successfully."
      redirect_to @registered_application
    else
      flash.now[:error] = "Your application was not updated, please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Your application was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "Your application was not deleted, please try again."
      render :show
    end
  end

  private

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end
end
