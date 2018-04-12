class TalkroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talkroom_channel"
    stream_for Talkroom.find(params[:location_path].split('/')[-1])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message'], user_id: current_user.id, talkroom_id: data['talkroom_id'])
  end
end
