module Spree
  module Admin

    OrdersController.class_eval do

      before_filter :establish_connection

      def fetch_app_synch
        begin 
          FetchApp.publish_order (Spree::Order.find_by_number params[:id])

          respond_to do |format|
            format.js { render 'spree/admin/shared/fetch_app_synch' }
          end

        rescue => problem
          respond_to do |format|
            flash.now[:error] = problem.to_s
            format.js { render 'spree/admin/shared/fetch_app_synch' }
          end
        end
      end

      def fetch_app_synch_all

        FetchApp.publish_orders

        respond_to do |format|
          format.js { render 'spree/admin/shared/fetch_app_synch_all' }
        end
      end

      private 

      def establish_connection
        FetchApp.establish_connection
      end
    end
  end
end
