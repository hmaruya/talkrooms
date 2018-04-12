class Message < ApplicationRecord
  belongs_to :user
  after_create_commit { MessageDeliveryJob.perform_later self }
end
