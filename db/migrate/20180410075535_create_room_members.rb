class CreateRoomMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :room_members do |t|
      t.references :talkroom, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
