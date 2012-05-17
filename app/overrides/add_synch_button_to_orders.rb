Deface::Override.new(:virtual_path  => 'spree/admin/orders/index',
                     :name          => 'fetchapp_orders_synch_button',
                     :insert_before => '#listing_orders[data-hook], [data-hook="listing_orders"]',
                     :text          => %(   <div class='toolbar order-links'>
                                               <%= button_link_to t(:fetchapp_synch_orders), fetchapp_synch_admin_orders_url, :icon => 'add', :id => 'admin_synch_orders_with_fetchapp' %>
                                            </div>
                                        )
                     )
