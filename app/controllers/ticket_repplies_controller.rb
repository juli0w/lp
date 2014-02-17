# encoding: UTF-8
class TicketReppliesController < ApplicationController
  before_filter :authenticate_user!

  layout 'dashboard'

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @repply = @ticket.ticket_repplies.new(params[:ticket_repply])

    @repply.user = current_user

    respond_to do |format|
      if (@ticket.user_id == current_user.id or current_user.admin?) and @repply.save
        format.html { redirect_to @ticket }
      else
        format.html { redirect_to @ticket, notice: "Ocorreu algum erro." }
      end
    end
  end
end