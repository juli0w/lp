# encoding: UTF-8
class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :authenticate_admin!, except: :show
  layout 'admin'

  def show
    @category = Category.find(params[:id])
    @products = Kaminari.paginate_array(sort(Category.load_products(params[:id]))).page(params[:page]).per(show_param)
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
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: 'Categoria atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end
end