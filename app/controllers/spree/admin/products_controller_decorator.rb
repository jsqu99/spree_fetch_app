# The first time this has ever happened to me in Spree: I couldn't use the 'safe' method
# of class_evaling e.g.:

# module Spree
#  module Admin
#    ProductsController.class_eval do

# For some reason, I think it was picking up the non-admin ProductsController as I was getting
# an 'action not found' for my new methods

Spree::Admin::ProductsController.class_eval do
  before_filter :establish_connection

  def fetch_app_synch
    begin 
      FetchApp.publish_product(Spree::Product.find_by_permalink params[:id])

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
    FetchApp.publish_products # to FetchApp
    FetchApp.pull_products    # from FetchApp

    respond_to do |format|
      format.js { render 'spree/admin/shared/fetch_app_synch_all' }
    end
  end

  private 

  def establish_connection
    FetchApp.establish_connection
  end
end
