class AddTalkroomToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :talkroom, foreign_key: true
  end
end
