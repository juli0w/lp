# encoding: UTF-8
class TicketReppliesController < ApplicationController
  before_filter :authenticate_user!

  layout 'dashboard'

  def create
    @ticket = current_user.tickets.find(params[:ticket_id])
    @repply = @ticket.ticket_repplies.new(params[:ticket_repply])

    @repply.user = current_user

    respond_to do |format|
      if @repply.save
        format.html { redirect_to @ticket }
      else
        format.html { redirect_to @ticket, notice: "Ocorreu algum erro." }
      end
    end
  end
end