require 'fetchapp-api-ruby'

class Spree::VariantObserver < ActiveRecord::Observer
  def after_save(model)
    if model.sku_changed?
      old_val,new_val = model.changes["sku"]
      Fetchapp.establish_connection
      Fetchapp.update_sku old_val, new_val
    end
  end
end
