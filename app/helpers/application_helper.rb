# encoding: UTF-8
module ApplicationHelper
  SIMULATOR_URL = {
    #resicolor: 'http://www.resicolor.com.br/paginas/espaco/simulador',
    resicolor: 'http://www.resicolor.com.br/espaco-color/simulador-ambientes',
    metalatex: 'http://www.sherwin-williams.com.br/simulador'
  }
  
  def meta_keywords content
    content || "loja do pintor, tintas, ferramentas, automotiva, imobiliária, tinta imobiliaria, tinta automotiva, pinceis, compressores"
  end
  
  def meta_description content
    content || "Encontre tudo em tintas imobiliárias, automotivas e industriais, além de toda linha de acessórios e ferramentas elétricas e manuais"
  end
  
  def content_title content
    title = "Loja do Pintor - "
    title += content.try(:humanize) || "Tudo em Tintas"
    
    return title
  end

  def monetize decimal
    number_to_currency decimal, unit: "R$ ", separator: ","
  end

  def filter_form path
    form_tag path do
      content_tag :fieldset do
        content_tag :p do
          text_field_tag(:search, '', class: "round small-width-input", autofocus: true, placeholder: "Palavra chave") +
          submit_tag("Filtrar", class: "button round blue image-right ic-search", style: "height: 36px")
        end
      end
    end
  end

  def external_simulator params
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

    url = SIMULATOR_URL[params]

    return "<iframe width='100%' height='600px' src='#{url}'></iframe>".html_safe
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

  def get_name i
    opts = i.respond_to?(:opts) ? i.opts : i.options

    name = i.item.name
    
    return name
  end
end
