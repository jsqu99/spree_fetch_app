Deface::Override.new(:virtual_path  => 'spree/admin/configurations/index',
                     :name          => 'fetch_app_configuration',
                     :insert_bottom => '[data-hook="admin_configurations_menu"]',
                     :text          => %(    <tr>
                       <td><%= link_to t(:fetch_app_settings), admin_fetch_app_settings_path %></td>
                       <td><%= t(:fetch_app_settings_description) %></td>
                     </tr>)
                     )
