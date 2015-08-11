class OrderMailer < ActionMailer::Base
  default from: "noreply@lojadopintor.net"
  
  def order_message purchase_id
    @purchase = Purchase.find(purchase_id)
    mail(:to => Setup.emails, :subject => 'Loja do Pintor - Pedido efetuado')
  end
end
