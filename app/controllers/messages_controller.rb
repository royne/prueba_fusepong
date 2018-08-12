class MessagesController < ApplicationController
  def index
    if current_user.has_role? :admin
      @messages = Message.all
    else
      redirect_to root_path  
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(messages_params)
    if @message.save
      redirect_to messages_path, notice:"El mensajero se ha creado con exito"
    else
      flash[:alert] = @message.errors.full_messages
      render :new
    end
  end

  private
    def messages_params
      params.require(:message).permit(:name, :document)
    end
end
