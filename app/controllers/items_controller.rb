# encoding: UTF-8
class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:search, :add_to_cart, :show]
  before_filter :authenticate_admin!, except: [:search, :add_to_cart, :show]
  layout 'admin'

  def importation
  end

  def import
    Item.import(params[:itens])
    redirect_to items_path, notice: "Produtos importados"
  end

  def index
    @items = Item.unscoped.page(params[:page]).per(20)
  end

  # def new
  #   @item = Item.new
  #   @categories = Category.all
  # end

  def show
    @item = Item.find(params[:id])

    render layout: 'application'
  end

  # def create
  #   @item = Item.new(params[:item])

  #   respond_to do |format|
  #     if @item.save
  #       format.html { redirect_to items_path, notice: 'Produto cadastrado com sucesso.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  def edit
    @item = Item.unscoped.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.unscoped.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to items_path, notice: 'Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  def search
    @items = Item.where("name LIKE ?", "%#{params[:q]}%").page(params[:page]).per(20)
    render layout: 'application'
  end

  # def filter
  #   @items = Item.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(20)
  #   render :index
  # end

  def add_to_cart
    current_cart.add_item(params[:id], params[:quantity])
    redirect_to controller: :cart, action: :index
  end

  def format
    Item.delete_all

    redirect_to importation_items_path, notice: "Produtos deletados"
  end
end