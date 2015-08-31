# encoding: UTF-8
class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:search, :add_to_cart, :show]
  before_filter :authenticate_admin!, except: [:search, :add_to_cart, :show]
  before_filter :find_item, only: [:show, :update, :edit, :add_to_cart]
  layout 'admin'

  def importation
  end

  def import
    Item.import(params[:itens])
    redirect_to items_path, notice: "Produtos importados"
  end

  def index
    @items = Item.page(params[:page]).per(20)
  end

  # def new
  #   @item = Item.new
  #   @categories = Category.all
  # end

  def show
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
    @categories = Category.all
  end

  def update
    @item = Item.unscoped.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to items_path, notice: 'Produto atualizado com sucesso.' }
        format.js { }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  def search
    @items = Item.where("name LIKE ?", "%#{params[:q]}%").page(params[:page]).per(20)
    render layout: 'application'
  end

  def filter
   @items = Item.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(20)
   render :index
  end

  def add_to_cart
    current_cart.add_item(@item.id, params[:quantity])
    redirect_to controller: :cart, action: :index
  end

  def format
    Item.delete_all

    redirect_to importation_items_path, notice: "Produtos deletados"
  end

private
  
  def find_item
    begin
      @item = Item.find_by_slug!(params[:id])
    rescue
      redirect_to root_url, notice: "Item não encontrado"
    end
  end
end