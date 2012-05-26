class Fetchapp 
  def self.establish_connection
    # TODO: Mike, how often must this be done?  once at server startup?
    app_name = SpreeFetchapp::Config[:app_name]
    login    = SpreeFetchapp::Config[:login]
    password = SpreeFetchapp::Config[:password]

    FetchAPI::Base.basic_auth(app_name, login, password)
  end

  def self.publish_order(order)
    sku_price_pairs = order.line_items.map { |li| [li.product.sku, li.price] }
    order_items = sku_price_pairs.inject([]) {|agg, pair| agg << {:sku => pair[0], :price => pair[1]}}
    
    order = FetchAPI::Order.create(
                                   :id => order.number,
                                   :title => order.number,
                                   :first_name => order.try(:ship_address).try(:firstname),
                                   :last_name => order.try(:ship_address).try(:lastname),
                                   :email => order.user.email,
                                   :order_items => order_items
                                   )

  end    

  def self.update_sku(old_sku, new_sku)
    item = FetchAPI::Item.find(old_sku)
    item.update(:sku => new_sku)
  end
end
