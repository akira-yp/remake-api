class V1::ChatsController < ApplicationController

  def index
    chats = Chat.where(user_id: params[:owner_id])
      .or(Chat.where(user_id: params[:designer_id]))
    render json: chats, methods:[:figure_url]
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      render json: chat, methods:[:figure_url]
    else
      render json: chat.errors, status: :bad_request
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, assign_id:, :figure).merge(user: current_v1_user)
  end
end
