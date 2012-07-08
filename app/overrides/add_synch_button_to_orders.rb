# all order
Deface::Override.new(:virtual_path  => 'spree/admin/orders/index',
                     :name          => 'fetch_app_orders_synch_button',
                     :insert_before => '#listing_orders[data-hook], [data-hook="listing_orders"]',
                     :text          => %(   <div class='toolbar order-links'>
                                               <div id="fetch_app_synch_notification"></div>
                                               <%= button_link_to t(:fetch_app_synch_orders), fetch_app_synch_all_admin_orders_url, :icon => 'add', :id => 'admin_synch_orders_with_fetch_app', :remote => true %>
                                            </div>
                                        )
                     )

# on edit screen
Deface::Override.new(:virtual_path  => 'spree/admin/orders/edit',
                     :name          => 'fetch_app_order_synch_button_edit',
                     :insert_top => '[data-hook="admin_order_edit_buttons"]',
                     :text          => %(   <div class='toolbar'>
                                               <div id="fetch_app_synch_notification"></div>
                                               <%= button_link_to t(:fetch_app_synch_order), fetch_app_synch_admin_order_url(@order), :icon => 'add', :id => 'admin_synch_order_with_fetch_app', :remote => true %>
                                            </div>
                                        )
                     )


# on show screen
Deface::Override.new(:virtual_path  => 'spree/admin/orders/show',
                     :name          => 'fetch_app_order_synch_button_show',
                     :insert_top => '[data-hook="admin_order_show_buttons"]',
                     :text          => %(   <div class='toolbar'>
                                               <div id="fetch_app_synch_notification"></div>
                                               <%= button_link_to t(:fetch_app_synch_order), fetch_app_synch_admin_order_url(@order), :icon => 'add', :id => 'admin_synch_order_with_fetch_app', :remote => true %>
                                            </div>
                                        )
                     )
