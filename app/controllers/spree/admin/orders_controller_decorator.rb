module Spree
  module Admin
    OrdersController.class_eval do

      def fetchapp_synch
        Fetchapp.establish_connection

        begin 
          Fetchapp.publish_order (Spree::Order.find_by_number params[:id])

          respond_to do |format|
            format.js
          end

        rescue => problem
          respond_to do |format|
            flash.now[:error] = problem.to_s
            format.js
          end
        end
      end

      def fetchapp_synch_all
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
        
        respond_to do |format|
          format.js
        end
      end
    end
  end
end
