# encoding: UTF-8
class ProfileController < ApplicationController
  before_filter :authenticate_user!
  layout 'dashboard'
  
  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to dashboard_index_path, notice: 'Informações atualizadas com sucesso.' }
      else
        format.html { redirect_to dashboard_profile_path }
      end
    end
  end

  def edit
    @profile = current_user.profile || current_user.create_profile
  end
end