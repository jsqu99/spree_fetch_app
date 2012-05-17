Deface::Override.new(:virtual_path  => 'spree/admin/configurations/index',
                     :name          => 'fetchapp_configuration',
                     :insert_bottom => '[data-hook="admin_configurations_menu"]',
                     :text          => %(    <tr>
                       <td><%= link_to t(:fetchapp_settings), admin_fetchapp_settings_path %></td>
                       <td><%= t(:fetchapp_settings_description) %></td>
                     </tr>)
                     )
