class SecureController < ApplicationController
  helper :authorization

  before_action :authenticate_user!
end