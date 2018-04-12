class MessageDeliveryJob < ApplicationJob
  queue_as :default

  def perform(message)
    TalkroomChannel.broadcast_to Talkroom.find(message.talkroom_id), message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end
end
