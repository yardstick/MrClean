class OfficesController < SecureController

  protect_from_forgery with: :exception

  before_action :get_offices, only:[:index]
  skip_before_action :authenticate_user!, only:[:index]

end