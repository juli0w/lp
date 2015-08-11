class SetupController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def update
    @setup = Setup.first
    
    @setup.update_attributes(params[:setup])
    redirect_to admin_setup_path, notice: 'Setup atualizado com sucesso.'
  end
end