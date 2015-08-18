# encoding: UTF-8
class ApplicationController < ActionController::Base
  rescue_from StandardError do |e|
    Failure.create!(
      name: e.class, message: e.message,
      backtrace: e.backtrace.join("\n"),
      state: false,
      details: session.as_json.to_s,
      request: request.as_json.to_s)
    
    redirect_to root_path, notice: "Ocorreu algum erro, contate nossa equipe!"
  end
  
  include CartEngine

  protect_from_forgery

  layout :layout_by_resource

  before_filter :load_nav
  before_filter :check_params
  before_filter :load_pages
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

  def redirect_to_back
    redirect_to (request.fullpath != session[:previous_url]) ? session[:previous_url] : root_path 
  end

  def check_params
    [:show, :order, :list].each do |param|
      unless params[param].blank?
        session[param] = params[param]
      end
    end
  end

  [:show, :order, :list].each do |param|
    define_method "#{param}_param" do
      session[param] || params[param]
    end

    helper_method "#{param}_param"
  end

  def sort arr
    arr.sort {|a,b| a.send(order_param || :name) <=> b.send(order_param || :name) }
  end

  def load_nav
    @categories_root = Category.roots.where(active: true)
  end

  def load_pages
    @pages         = Page.pages
    @notices       = Page.notices
    @company_pages = Page.company
  end

  def store_location
      if (request.fullpath != "/users/sign_in" && \
          request.fullpath != "/users/sign_up" && \
          request.fullpath != "/users/password" && \
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath 
      end
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
