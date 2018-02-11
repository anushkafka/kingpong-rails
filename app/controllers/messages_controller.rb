class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = Player.find(session[:player_id]).reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
    
  end

  private
  def set_conversation
    @conversation = Player.find(session[:player_id]).mailbox.conversations.find(params[:conversation_id])
  end

  # def mailboxer_email(object)
  #   #return the model's email here
  #   return "define_email@on_your.model"
  # end
end
