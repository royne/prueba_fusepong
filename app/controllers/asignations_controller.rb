class AsignationsController < ApplicationController
  def new
    @asignation = Asignation.new
  end

  def create
    @service = Service.find(params[:id])
    # byebug
    @asignation = Asignation.create(asignation_params)

    if @asignation.save
      redirect_to services_path, notice:"El mensajero se ha asignado con exito"
    else
      flash[:alert] = @asignation.errors.full_messages
      render :new
    end
  end

  private
    def asignation_params
      params.require(:asignation).permit(:user_id, :service_id)
    end
end
