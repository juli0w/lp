# encoding: UTF-8
class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:contact]
  before_filter :authenticate_admin!, only: [:new, :create]
  layout 'dashboard', except: [:new]

  def index
    @messages = current_user.messages.page(params[:page])
  end

  def show
    @message = current_user.messages.find(params[:id])

    @message.mark_as_read!
  end

  def new
    @user    = User.find(params[:user_id])
    @message = Message.new(user_id: params[:user_id])

    render layout: 'admin'
  end

  def contact
    if Message.send_to_admins(params[:message])
      redirect_to :back, alert: "Agradecemos sua mensagem!"
    else
      redirect_to :back, alert: "Preencha todos os campos corretamente"
    end
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to users_path, notice: 'Mensagem enviada com sucesso.' }
      else
        format.html { @user = User.find(params[:message][:user_id]); render :new }
      end
    end
  end
end