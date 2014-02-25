# encoding: UTF-8
class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:search, :add_to_cart, :show]
  before_filter :authenticate_admin!, except: [:search, :add_to_cart, :show]
  layout 'admin'

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
    
    Size.all.each do |s|
      @product.product_sizes.build(product_id: @product.id, size_id: s.id, price: 0)
    end
    
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])

    render layout: 'application'
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Produto cadastrado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_path, notice: 'Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:q]}%").order(order_param).page(params[:page]).per(show_param)
    render layout: 'application'
  end

  def filter
    @products = Product.where("name LIKE ?", "%#{params[:search]}%").page(params[:page])
    render :index
  end

  def add_to_cart
    current_cart.add_item(params[:id], params[:color_id], params[:size_id])
    redirect_to controller: :cart, action: :index
  end
end