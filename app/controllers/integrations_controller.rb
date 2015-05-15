# encoding: UTF-8
class IntegrationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def import
    if params[:familias].blank? or params[:grupos].blank? or params[:subgrupos].blank?
      redirect_to importation_categories_path, alert: "Envie todos os arquivos"
    else
      Category.import(params[:familias], params[:grupos], params[:subgrupos])
      redirect_to categories_path, notice: "Categorias importadas"
    end
  end

  def show
    @category = Category.find(params[:id])
    @items    = Kaminari.paginate_array(sort(Category.load_products(params[:id]))).page(params[:page]).per(20)
    render layout: 'application'
  end

  def index
    @categories_root = Category.roots
    # @categories_root = Category.all
  end
end