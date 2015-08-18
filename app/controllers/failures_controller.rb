class FailuresController < ApplicationController
  before_filter :authenticate_admin!
  layout 'oops'
  
  def index
    @failures = Failure.opened.order("created_at DESC")
  end
  
  def show
    @failure = Failure.find(params[:id])
  end
  
  def close
    @failure = Failure.find(params[:id])
    @failure.update_attributes(state: true)
    
    redirect_to failures_path
  end
  
  def closed
    @failures = Failure.closed.order("created_at DESC")
    render :index
  end
end
