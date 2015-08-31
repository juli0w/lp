# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "www.lojadopintor.net"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
end

sitemap_for Item.actives do |item|
  url item, last_mod: item.updated_at
end

sitemap_for Page.scoped do |item|
  url item, last_mod: item.updated_at
end

sitemap_for Category.scoped do |item|
  url item, last_mod: item.updated_at
end

ping_with "http://#{host}/sitemap.xml"