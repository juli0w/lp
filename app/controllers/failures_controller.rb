class FailuresController < ApplicationController
  layout 'oops'
  
  def index
    @failures = Failure.order("created_at DESC")
  end
end
