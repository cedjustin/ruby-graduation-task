class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
    end

    def create
        if Conversation.between(params[:sender_id], params[:recipient_id]).present?
          @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
        else
          @conversation = Conversation.create!(conversation_params)
          user = User.where(id: params[:recipient_id])
          p user[0]
          UserNotifierMailer.send_conversation_email(user[0]).deliver
        end
        redirect_to conversation_messages_path(@conversation)
    end
    
    private
    
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
