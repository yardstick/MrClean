class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?

  private

    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def get_current_office
      if params[:office_id].present?
        @current_office = Office.find(params[:office_id])
      else
        @current_office = Office.first
      end
    end

    def get_offices
      @offices = Office.all
    end    
end
