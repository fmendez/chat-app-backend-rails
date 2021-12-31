class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new(message_params)
    ActionCable.server.broadcast('message_channel', message) if message.save
    head :ok
  end

  def message_params
    params.require(:messages).permit(:content)
  end
end
