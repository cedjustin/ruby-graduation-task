class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  after_create_commit{
    MessageBroadCastJob.perform_later(self)
  }

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

end
