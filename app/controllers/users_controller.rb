# encoding: UTF-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def ban
    @user = User.find(params[:id])
    redirect_to [:edit, @user]
    
    @user.ban!
  end

  def unban
    @user = User.find(params[:id])
    @user.unban!
    
    redirect_to [:edit, @user]
  end

  def permit
    @user = User.find(params[:id])
    @user.permit!

    redirect_to [:edit, @user]
  end
end