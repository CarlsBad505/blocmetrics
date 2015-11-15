class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]

  # GET /registered_applications
  # GET /registered_applications.json
  def index
    @user = current_user
    @registered_applications = @user.registered_applications
  end

  # GET /registered_applications/1
  # GET /registered_applications/1.json
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by { |e| e.name }
  end

  # GET /registered_applications/new
  def new
    @registered_application = RegisteredApplication.new
  end

  # GET /registered_applications/1/edit
  def edit
  end

  # POST /registered_applications
  # POST /registered_applications.json
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

  # PATCH/PUT /registered_applications/1
  # PATCH/PUT /registered_applications/1.json
  def update
    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_applications/1
  # DELETE /registered_applications/1.json
  def destroy
    @registered_application.destroy
    respond_to do |format|
      format.html { redirect_to registered_applications_url, notice: 'Registered application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end
end
