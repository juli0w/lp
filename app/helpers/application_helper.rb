# encoding: UTF-8
module ApplicationHelper
  def monetize decimal
    number_to_currency decimal, unit: "R$ ", separator: ","
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
