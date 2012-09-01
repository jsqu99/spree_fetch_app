class FetchApp 
  def self.establish_connection
    # TODO: Mike, how often must this be done?  once at server startup?
    app_name = SpreeFetchApp::Config[:app_name]
    login    = SpreeFetchApp::Config[:api_key]
    password = SpreeFetchApp::Config[:api_token]

    FetchAppAPI::Base.basic_auth({:url => app_name, :key => login, :token => password})
  end

  def self.publish_orders
    Spree::Order.find_each do |order| 
      begin 
        FetchApp.publish_order order
      rescue
        # i don't care if this fails.  We try all products in the system (some of which may not be fetch_app-ified), as we 
        # retain no knowledge of fetch_app details within our spree app
        nil
      end
    end
  end

  def self.publish_order(order)

    sku_price_pairs = order.line_items.map { |li| [li.product.sku, li.price] }
    order_items = sku_price_pairs.inject([]) {|agg, pair| agg << {:sku => pair[0], :price => pair[1]}}
    
    order = FetchAppAPI::Order.create(
                                   :id => order.number,
                                   :title => order.number,
                                   :first_name => order.try(:ship_address).try(:firstname),
                                   :last_name => order.try(:ship_address).try(:lastname),
                                   :email => order.user.email,
                                   :order_items => order_items
                                   )

  end    

  def self.publish_products
    # create or update all spree products in fetchapp
    Spree::Product.find_each do |product| 
      begin 
        FetchApp.publish_product product
      rescue
        # TODO: now to handle error notification here?
        nil
      end
    end

  end  

  def self.pull_products
    # fetch every fetchapp product
    fetchapp_products = FetchAppAPI::Product.find(:all)

    fetchapp_products.each do |fetchapp_product|
      variant = Spree::Variant.find_by_sku(fetchapp_product.sku)
      next if variant.present?

      # create this product in spree since we haven't yet seen it
      spree_product = Spree::Product.create(:sku => fetchapp_product.sku, :name => fetchapp_product.name, :price => fetchapp_product.price)
    end
  end

  # updates or creates a product in fetchapp to match the details of this spree product
  def self.publish_product(product)
    # throws a not found if not found
    fetchapp_product = FetchAppAPI::Product.find(product.sku) rescue nil

    if fetchapp_product.present?
      # update any changed elements
      fetchapp_product.update(:name => product.name) unless fetchapp_product.name == product.name
      fetchapp_product.update(:price => product.price) unless fetchapp_product.price == product.price
    else
      # create new product
      fetchapp_product = FetchAppAPI::Product.create(:sku => product.sku, :name => product.name, :price => product.price)
    end

  end    

  def self.update_sku(old_sku, new_sku)
    product = FetchAppAPI::Product.find(old_sku)
    product.update(:sku => new_sku)
  end
end
