class RoomMember < ApplicationRecord
  belongs_to :talkroom
  belongs_to :user
end
