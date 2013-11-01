# encoding: UTF-8
class SizesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @sizes = Size.all
  end

  # def show
  #   @size = Size.find(params[:id])
  # end

  def new
    @size = Size.new
  end

  def create
    @size = Size.new(params[:size])

    respond_to do |format|
      if @size.save
        format.html { redirect_to sizes_path, notice: 'Recipiente cadastrado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @size = Size.find(params[:id])
  end

  def update
    @size = Size.find(params[:id])

    respond_to do |format|
      if @size.update_attributes(params[:size])
        format.html { redirect_to sizes_path, notice: 'Recipiente atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy

    redirect_to sizes_path
  end
end