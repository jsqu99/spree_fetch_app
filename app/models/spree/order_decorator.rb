require 'fetchapp-api-ruby'

module Spree

  Order.class_eval do
    Spree::Order.state_machines[:state].after_transition :to => 'complete', :do => :create_order_in_fetch_app

    private

    def create_order_in_fetch_app
      begin 

        # never mess with the standard order flow.  
        Thread.new {
          FetchApp.establish_connection
          FetchApp.publish_order self
        }
      rescue => e

        # i don't care if this fails.  We try all products in the system (some of which may not be fetch_app-ified), as we 
        # retain no knowledge of fetch_app details within our spree app
        # We can manually synch any orders on-demand later in the admin app
        nil
      end
    end
  end
end
