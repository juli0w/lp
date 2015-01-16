# encoding: UTF-8
class CartController < ApplicationController
  before_filter :authenticate_user!, only: [:shipping, :confirm, :purchase]

  def index
  end

  def clean
    session[:cart] = nil
    redirect_to cart_index_path
  end

  def remove
    current_cart.remove params[:sku]
    redirect_to cart_index_path, notice: "Item removido do carrinho."
  end

  def update
    params['item'].each do |item_id, quantity|
      current_cart.update_quantity item_id, quantity
    end

    redirect_to cart_index_path, notice: "Carrinho atualizado com sucesso."
  end

  def shipping
    if current_cart.total < 30
      redirect_to cart_index_path, notice: "Seu carrinho precisa conter o valor mínimo de R$ 30,00 para finalizar a compra."
    else
      profile = current_user.profile || current_user.build_profile

      @purchase = Purchase.new({
          name:       profile.name,
          cep:        profile.cep,
          phone:      profile.phone,
          cellphone:  profile.cellphone,
          city:       profile.city,
          uf:         profile.uf,
          district:   profile.district,
          address:    profile.address,
          number:     profile.number,
          complement: profile.complement
        })
    end
  end

  def purchase
    @purchase = current_cart.to_purchase(current_user.id)
    @purchase.update_address(params[:purchase])

    redirect_to @purchase
  end
end