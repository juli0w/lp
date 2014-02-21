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
    User.where(state: 2).each do |user|
      @message = Message.create({
        message: "Nome: #{params[:message][:name]}
        <br />Email: #{params[:message][:email]}
        <br />Mensagem: #{params[:message][:message]}",
        user_id: user.id,
        subject: "Contato"})
    end

    redirect_to :back, alert: "Agradecemos sua mensagem!"
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