class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messags_channel'
  end

  def unsubscribed; end
end
