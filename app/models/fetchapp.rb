class Fetchapp 
  def self.establish_connection
    # TODO: Mike, how often must this be done?  once at server startup?
    app_name = SpreeFetchapp::Config[:app_name]
    login    = SpreeFetchapp::Config[:login]
    password = SpreeFetchapp::Config[:password]

    FetchAPI::Base.basic_auth(app_name, login, password)
  end

  def self.publish_order(order)
    skus = order.line_items.map { |li| li.product.sku }
    order_items = skus.inject([]) {|agg, sku| agg << {:sku => sku}}
    
    order = FetchAPI::Order.create(
                                   :id => order.number,
                                   :title => order.number,
                                   :first_name => order.try(:ship_address).try(:firstname),
                                   :last_name => order.try(:ship_address).try(:lastname),
                                   :email => order.user.email,
                                   :order_items => order_items
                                   )

  end    
end
