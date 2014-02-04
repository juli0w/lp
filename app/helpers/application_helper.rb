# encoding: UTF-8
module ApplicationHelper
  def monetize decimal
    number_to_currency decimal, unit: "R$ ", separator: ","
  end

  def external_simulator
    s = '<base href="http://resicolor.com.br/" />
         <script type="text/javascript" src="http://www.resicolor.com.br/js/jquery/jquery.flash.js"></script>
         <link rel="canonical" href="http://www.resicolor.com.br/paginas/espaco/simulador" />
         <object width="800" height="600" type="application/x-shockwave-flash" data="http://resicolor.com.br/simulador_loader.swf"> <param name="movie" value="http://resicolor.com.br/simulador_loader.swf" /> <param name="quality" value="high" /> <param name="wmode" value="transparent" /> </object>
         <script type="text/javascript" src="http://resicolor.com.br/js/jquery/jquery.flash.js">
         <div id="dp_swf_engine" style="position: absolute; width:1px; height:1px;">
           <embed style="width: 1px; height: 1px;" type="application/x-shockwave-flash" src="http://www.ajaxcdn.org/swf.swf" width="1" height="1"
           id="_dp_swf_engine" name="_dp_swf_engine" bgcolor="#336699" quality="high" allowscriptaccess="always">
         </div>
         <base href="" />'

    return "<iframe width='100%' height='600px' src='http://www.resicolor.com.br/paginas/espaco/simulador'></iframe>".html_safe
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
