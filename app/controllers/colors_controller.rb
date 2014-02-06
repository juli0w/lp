# encoding: UTF-8
class ColorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @colors = Color.page(params[:page])
  end

  # def show
  #   @color = Color.find(params[:id])
  # end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(params[:color])

    respond_to do |format|
      if @color.save
        format.html { redirect_to colors_path, notice: 'Cor cadastrada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])

    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to colors_path, notice: 'Cor atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy

    redirect_to colors_path
  end
end