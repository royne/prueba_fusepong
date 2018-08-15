class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
    @asignations = Asignation.all
    @user_message = User.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.create(services_params)
    if @service.save
      redirect_to services_path, notice:"El servicio se ha solicitado con exito"
    else
      flash[:alert] = @service.errors.full_messages
      render :new
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  private
    def services_params
      params.require(:service).permit(:origin, :destination, :date, :time)
    end
end
