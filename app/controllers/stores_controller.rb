class StoresController < ApplicationController

  before_action :require_login

  def index
  	@sucursales = Store.all
  end
end
