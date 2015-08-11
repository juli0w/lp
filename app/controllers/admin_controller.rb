class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
  end
  
  def setup
    @setup = Setup.first
  end
end