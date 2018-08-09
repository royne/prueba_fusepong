class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(services_params)
    if @service.save
      redirect_to services_path, notice:"El servicio se ha solicitado con exito"
    else
      flash[:alert] = @service.errors.full_messages
      render :new
    end
  end

  private
    def services_params
      params.require(:service).permit(:origin, :destination, :date, :time)
    end
end
