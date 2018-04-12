class TalkroomsController < ApplicationController
  def show
    @messages = Message.where(talkroom_id:params[:id])
    @talkroom_id = params[:id]
  end
end
