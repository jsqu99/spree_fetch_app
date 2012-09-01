require 'fetchapp-api-ruby'

class Spree::VariantObserver < ActiveRecord::Observer
  def after_update(model)
    if model.sku_changed?
      old_val,new_val = model.changes["sku"]
      FetchApp.establish_connection
      FetchApp.update_sku old_val, new_val
    end
  end
end
