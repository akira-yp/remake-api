class V1::ChatsController < ApplicationController
  before_action :authenticate_v1_user!, only:[:create]

  def index
    chats = Chat.where(assign_id: params[:assign_id]).order(created_at: "DESC")
    chats = chats.map do |chat|
      { id: chat.id,
        userid: chat.user_id,
        name: chat.user.name,
        avatar: chat.user.profile.avatar_url,
        content: chat.content,
        figure_url: chat.figure_url,
        created_at: chat.created_at.strftime("%m月%d日%H:%M:%S")
       }
    end
    render json: chats
  end

  def create
    chat = current_v1_user.chats.build(chat_params)
    if chat.save
      chat = {
        id: chat.id,
        userid: chat.user_id,
        name: chat.user.name,
        avatar: chat.user.profile.avatar_url,
        content: chat.content,
        figure_url: chat.figure_url,
        created_at: chat.created_at.strftime("%m月%d日%H:%M:%S")
      }
      render json: chat
    else
      render json: chat.errors, status: :bad_request
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :assign_id, :figure)
  end
end
