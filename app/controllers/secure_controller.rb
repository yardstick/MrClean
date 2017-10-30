class SecureController < ApplicationController
  helper :authentication

  before_action :authenticate_user!
end