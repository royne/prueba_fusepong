class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
    @asignations = Asignation.all
    @user_message = User.all

    if current_user.has_role? :message
      redirect_to message_path(current_user.id)
    end
    @state = {:Nuevo => 1, :Asignado => 2, :proceso => 3, :Terminado => 4}
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
    restriction_views
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(services_params)

    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @service }

    end
  end

  private
    def services_params
      params.require(:service).permit(:origin, :destination, :date, :time, :state)
    end

    def restriction_views
      if current_user.has_role? :client
        redirect_to root_path
      elsif current_user.has_role? :message
        redirect_to message_path(current_user.id)
      end
    end
end
