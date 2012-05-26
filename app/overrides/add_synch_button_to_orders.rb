# all order
Deface::Override.new(:virtual_path  => 'spree/admin/orders/index',
                     :name          => 'fetchapp_orders_synch_button',
                     :insert_before => '#listing_orders[data-hook], [data-hook="listing_orders"]',
                     :text          => %(   <div class='toolbar order-links'>
                                               <div id="fetchapp_synch_notification"></div>
                                               <%= button_link_to t(:fetchapp_synch_orders), fetchapp_synch_all_admin_orders_url, :icon => 'add', :id => 'admin_synch_orders_with_fetchapp', :remote => true %>
                                            </div>
                                        )
                     )

# on edit screen
Deface::Override.new(:virtual_path  => 'spree/admin/orders/edit',
                     :name          => 'fetchapp_order_synch_button_edit',
                     :insert_top => '[data-hook="admin_order_edit_buttons"]',
                     :text          => %(   <div class='toolbar'>
                                               <div id="fetchapp_synch_notification"></div>
                                               <%= button_link_to t(:fetchapp_synch_order), fetchapp_synch_admin_order_url(@order), :icon => 'add', :id => 'admin_synch_order_with_fetchapp', :remote => true %>
                                            </div>
                                        )
                     )


# on show screen
Deface::Override.new(:virtual_path  => 'spree/admin/orders/show',
                     :name          => 'fetchapp_order_synch_button_show',
                     :insert_top => '[data-hook="admin_order_show_buttons"]',
                     :text          => %(   <div class='toolbar'>
                                               <div id="fetchapp_synch_notification"></div>
                                               <%= button_link_to t(:fetchapp_synch_order), fetchapp_synch_admin_order_url(@order), :icon => 'add', :id => 'admin_synch_order_with_fetchapp', :remote => true %>
                                            </div>
                                        )
                     )
