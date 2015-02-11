# encoding: UTF-8
class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_filter :authenticate_admin!, except: [:show]
  layout 'admin'

  def index
    respond_to do |format|
      format.html { @pages = Page.page(params[:page]) }
      format.csv { send_data Page.to_csv }
    end
  end
  
  def importation
  end

  def import
    Page.from_csv(params[:csv])
    redirect_to pages_path, notice: "Páginas importadas"
  end

  def show
    @page = Page.find_by_slug(params[:slug])
    render layout: 'application'
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Página cadastrada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to pages_path, notice: 'Página atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_path
  end
end