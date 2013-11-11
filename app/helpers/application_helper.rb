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
    name = item.product.name
    name += " - #{item.color_name}" unless item.opts.has_key?('color_id')
    name += " - #{item.size_name}" unless item.opts.has_key?('size_id')

    return name
  end
end
