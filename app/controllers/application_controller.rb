# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  before_filter :load_nav
  after_filter :store_location

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || dashboard_index_path
  end

  def authenticate_admin!
    if !current_user || !current_user.admin?
      redirect_to dashboard_index_path, notice: 'Sem permissão.'
    end
  end

protected

  def load_nav
    @categories_root = Category.roots
  end

  def store_location
      if (request.fullpath != "/users/sign_in" && \
          request.fullpath != "/users/sign_up" && \
          request.fullpath != "/users/password" && \
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath 
      end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
