module Spree
  module Admin
    OrdersController.class_eval do

      # this is called via ajax so maybe we eventually return a count of all orders synched?
      def fetchapp_synch
        Fetchapp.establish_connection

        Spree::Order.find_each do |order| 
          begin 
            Fetchapp.publish_order order
          rescue
            # i don't care if this fails.  We try all products in the system (some of which may not be fetchapp-ified), as we 
            # retain no knowledge of fetchapp details within our spree app
            nil
          end
        end
        redirect_to admin_orders_path
      end
    end
  end
end
