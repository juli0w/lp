# encoding: UTF-8
module ApplicationHelper
  def monetize decimal
    number_to_currency decimal, unit: "R$ ", separator: ","
  end

  def external_simulator
    res = Net::HTTP.get_response(URI.parse('http://resicolor.com.br/paginas/espaco/simulador'))

    s = '<base href="http://resicolor.com.br/" />
         <script type="text/javascript" src="/js/jquery/jquery.flash.js"></script>
         <link rel="canonical" href="http://www.resicolor.com.br/paginas/espaco/simulador" />
         <object width="800" height="600" type="application/x-shockwave-flash" data="./simulador_loader.swf"> <param name="movie" value="./simulador_loader.swf" /> <param name="quality" value="high" /> <param name="wmode" value="transparent" /> </object>'

    return s.html_safe
  end

  def breadcumb category
    breadcumb = link_to(category.name, category)
    parent = category.parent
    while !parent.blank?
      breadcumb = "#{link_to parent.name, parent} › #{breadcumb}"
      parent = parent.parent
    end

    breadcumb.html_safe
  end

  def new_messages
    if current_user.messages.unread.any?
      "#{current_user.messages.unread.count} novas mensagens"
    else
      "Nenhuma nova mensagem"
    end
  end

  def get_image image
    image.blank? ? "/assets/no-image.jpg" : image
  end

  def get_name item
    opts = item.respond_to?(:opts) ? item.opts : item.options

    name = item.product.name

    unless opts[:color_id].blank?
      name += " - #{item.color_name}"
    end

    unless opts[:size_id].blank?
      name += " - #{item.size_name}"
    end

    return name
  end
end
