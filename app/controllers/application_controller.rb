class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?

  helper_method :current_office

  private

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def current_office
      @current_office ||= begin
        if params[:office_id].present?
          Office.find(params[:office_id])
        else
          Office.first
        end
      end
    end

    def get_offices
      @offices = Office.all
    end    
end
