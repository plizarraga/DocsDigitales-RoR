class StoresController < ApplicationController

  before_action :require_login

  def index
  	@sucursales = User.find(session[:user_id]).stores
  end
end
