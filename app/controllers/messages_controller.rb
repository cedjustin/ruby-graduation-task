class MessagesController < ApplicationController
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end


    def index
        # These are statements written in the index action
        # To make it easier to understand what you are doing in each part
        # Although it is written like this, because it is a little redundant code to use it in actual field
        # If you have the extra resources, try to refactor your code!
        @messages = @conversation.messages
        if @messages.length > 6
            @over_six = true
            @messages = Message.where(id: @messages[-6..-1].pluck(:id))
        end
        if params[:m]
            @over_six = false
            @messages = @conversation.messages
        end
        if @messages.last
            @messages.where.not(user_id: current_user.id).update_all(read: true)
        end
        @messages = @messages.order(:created_at)
        @message = @conversation.messages.build
    end

    def create
        @message = @conversation.messages.build(message_params)
        @message.isSender = check_if_sender_or_receiver(@message)
        @message.save
    end

    def check_if_sender_or_receiver(message)
        if @conversation["sender_id"] == message.user.id
            return true
        else
            return false
        end
    end

    helper_method :check_if_sender_or_receiver

    private
    def message_params
        params.require(:message).permit(:body, :user_id)
    end
end
