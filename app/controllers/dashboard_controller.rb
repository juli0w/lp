class DashboardController < ApplicationController
  before_filter :authenticate_user!
  layout 'dashboard'

  def index
  end

  def profile
    redirect_to controller: :profile, action: :edit
  end
end
