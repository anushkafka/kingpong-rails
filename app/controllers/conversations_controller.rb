class ConversationsController < ApplicationController
  def index
    @conversations = Player.find(session[:player_id]).mailbox.conversations 
  end

  def show
    @conversation = Player.find(session[:player_id]).mailbox.conversations.find(params[:id])
  end

  def new
    @recepients = Player.all - [Player.find(session[:player_id])]
  end

  def create
    current_user = Player.find(session[:player_id])
    recepient = Player.find(params[:player_id])
    current_user.send_message(recepient, params[:body], params[:subject])
  end

  def mailboxer_email(object)
    #return the model's email here
    return "define_email@on_your.model"
  end
end