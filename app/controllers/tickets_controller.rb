# encoding: UTF-8
class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:pending, :open, :close]

  layout 'dashboard'

  def index
    @tickets = current_user.tickets.page(params[:page])
  end

  def list
    @tickets = Ticket.page(params[:page])

    render 'index'
  end

  def show
    if current_user.admin?
      @ticket = Ticket.find(params[:id])
    else
      @ticket = current_user.tickets.find(params[:id])
    end

    @repplies = @ticket.ticket_repplies
  end

  def pending
    @tickets = Ticket.page(params[:page])
  end

  def new
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_path, notice: 'Ticket aberto com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def open
    @ticket = Ticket.find(params[:id]).open!

    redirect_to @ticket
  end

  def close
    @ticket = Ticket.find(params[:id]).close!

    redirect_to @ticket
  end
end