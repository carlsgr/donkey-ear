class ChatsController < ApplicationController
  def index
    @chats = Chat.where("user1_id = ? OR user2_id = ?", current_user.id, current_user.id)
    redirect_to chat_path(@chats.last)
  end

  def show
    set_chat
    @chats = Chat.where("user1_id = ? OR user2_id = ?", current_user.id, current_user.id)
    @messages = @chat.messages
  end

  def new
    @participant = User.find(params[:participant_id])
    @chat = Chat.create(user1: current_user, user2: @participant)
    redirect_to chat_path(@chat)
  end


  private
  def set_chat
    @chat = Chat.find(params[:id])
  end
end