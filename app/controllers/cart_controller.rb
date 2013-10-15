class CartController < ApplicationController
  before_filter :authenticate_user!, only: [:shipping, :confirm, :purchase]

  def index
  end

  def clean
    session[:cart] = nil
    redirect_to cart_index_path
  end

  def remove
    current_cart.remove params[:id]
    redirect_to cart_index_path, notice: "Item removido do carrinho."
  end

  def update
    params['product'].each do |product_id, quantity|
      current_cart.update_quantity product_id, quantity
    end

    redirect_to cart_index_path, notice: "Carrinho atualizado com sucesso."
  end

  def shipping
    profile = current_user.profile

    @purchase = Purchase.new({
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

  def purchase
    @purchase = current_cart.to_purchase(current_user.id)
    @purchase.update_address(params[:purchase])

    redirect_to @purchase
  end
end