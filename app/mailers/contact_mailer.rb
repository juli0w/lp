class ContactMailer < ActionMailer::Base
  default from: "noreply@lojadopintor.net"
  
  def contact_message message
    @message = message
    mail(:to => Setup.emails, :subject => 'Loja do Pintor - Mensagem de contato')
  end
end
