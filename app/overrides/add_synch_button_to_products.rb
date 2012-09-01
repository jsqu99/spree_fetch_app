# all products
Deface::Override.new(:virtual_path  => 'spree/admin/products/index',
                     :name          => 'fetch_app_products_synch_button',
                     :insert_after => '#new_product[data-hook], [data-hook="new_product"]',
                     :text          => %(  
<div class="toolbar" data-hook="toolbar">
  <ul class="actions">
    <li id="new_product_link">
     <div id="fetch_app_synch_product_notification"></div>
     <%= button_link_to t(:fetch_app_synch_products), fetch_app_synch_all_admin_products_url, :icon => 'add', :id => 'admin_synch_products_with_fetch_app', :remote => true %>
    </li>
  </ul>
  <br class="clear" />
</div>
)
)

# on edit screen
Deface::Override.new(:virtual_path  => 'spree/admin/products/_form',
                     :name          => 'fetch_app_product_synch_button_edit',
                     :insert_top => '[data-hook="admin_product_form_right"]',
                     :text          => %(   <div class='toolbar'>
                                               <div id="fetch_app_synch_notification"></div>
                                               <%= button_link_to t(:fetch_app_synch_product), fetch_app_synch_admin_product_url(@product), :icon => 'add', :id => 'admin_synch_product_with_fetch_app', :remote => true %>
                                            </div>
                                        )
                     )
