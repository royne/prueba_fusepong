class MessagesController < ApplicationController
  def index
    if current_user.has_role? :admin
      @messages = User.all
    else
      redirect_to root_path
    end
  end

  def new
    @message = User.new
  end

  def create
    @message = User.create(users_params)
    @message.remove_role :client
    @message.add_role :message
    if @message.save
      redirect_to root_path, notice:"El mensajero se ha creado con exito"
    else
      flash[:alert] = @message.errors.full_messages
      render :new
    end
  end

  def show
    @asignations = Asignation.where(user_id: params[:id])
  end

  private
    def messages_params
      params.require(:message).permit(:name, :document, :email, :password)
    end

    def users_params
      params.require(:user).permit(:name, :document, :email, :password)
    end
end
