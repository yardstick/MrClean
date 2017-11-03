class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

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
