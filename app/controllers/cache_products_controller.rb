# encoding: UTF-8
class CacheProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @cache_products = CacheProduct.order("ID desc").page(params[:page])
  end

  def new
    @cache_product = CacheProduct.new
  end

  def create
    @cache_product = CacheProduct.new(params[:cache_product])

    respond_to do |format|
      if @cache_product.save
        format.html { redirect_to cache_products_path, notice: 'Produto configurado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @cache_product = CacheProduct.find(params[:id])
  end

  def update
    @cache_product = CacheProduct.find(params[:id])

    respond_to do |format|
      if @cache_product.update_attributes(params[:cache_product])
        format.html { redirect_to cache_products_path, notice: 'Configuração atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cache_product = CacheProduct.find(params[:id])
    @cache_product.destroy

    redirect_to cache_products_path
  end
end