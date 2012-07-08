module Spree
  module Admin
    OrdersController.class_eval do

      def fetch_app_synch
        FetchApp.establish_connection

        begin 
          FetchApp.publish_order (Spree::Order.find_by_number params[:id])

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

      def fetch_app_synch_all
        FetchApp.establish_connection
        
        Spree::Order.find_each do |order| 
          begin 
            FetchApp.publish_order order
          rescue
            # i don't care if this fails.  We try all products in the system (some of which may not be fetch_app-ified), as we 
            # retain no knowledge of fetch_app details within our spree app
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
