module Spree
  module Admin
    class FetchappSettingsController < BaseController

      def update
        SpreeFetchapp::Config.set(params[:preferences])

        respond_to do |format|
          format.html {
            redirect_to admin_fetchapp_settings_path
          }
        end
      end

    end
  end
end
