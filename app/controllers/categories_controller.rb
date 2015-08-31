# encoding: UTF-8
class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :authenticate_admin!, except: :show
  before_filter :find_category, only: [:show, :update, :edit, :destroy]
  layout 'admin'

  def importation
  end

  def import
    if params[:familias].blank? or params[:grupos].blank? or params[:subgrupos].blank?
      redirect_to importation_categories_path, alert: "Envie todos os arquivos"
    else
      Category.import(params[:familias], params[:grupos], params[:subgrupos])
      redirect_to categories_path, notice: "Categorias importadas"
    end
  end

  def show
    @items = Kaminari.paginate_array(Category.load_products(params[:id])).page(params[:page]).per(20)
    render layout: 'application'
  end

  def index
    @categories_root = Category.roots
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Categoria criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Categoria atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def format
    Category.delete_all

    redirect_to importation_categories_path, notice: "Categorias deletadas"
  end
  
private
  
  def find_category
    begin
      @category = Category.find_by_slug!(params[:id])
    rescue
      redirect_to root_url, notice: "Categoria não encontrada"
    end
  end
end