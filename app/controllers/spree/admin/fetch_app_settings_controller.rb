module Spree
  module Admin
    class FetchAppSettingsController < BaseController

      def update
        SpreeFetchApp::Config.set(params[:preferences])

        respond_to do |format|
          format.html {
            redirect_to admin_fetch_app_settings_path
          }
        end
      end

    end
  end
end
