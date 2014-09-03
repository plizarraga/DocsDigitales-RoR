class StoresController < ApplicationController

	before_action :require_login

	def index
		@sucursales = User.find(session[:user_id]).stores
	end

	def new
		@sucursal = Store.new
		3.times { @sucursal.employees.build }
	end

	def create
		@sucursal = Store.new(store_params)
		@sucursal.user_id = session[:user_id]

		if @sucursal.save
			redirect_to @sucursal
		else
			render 'new'
		end
	end

	def show
		@sucursal = Store.find(params[:id])
	end

	def edit
		@sucursal = Store.find(params[:id])
	end

	def update
		@sucursal = Store.find(params[:id])

		if @sucursal.update(store_params)
			redirect_to @sucursal
		else
			render 'edit'
		end
	end

	def destroy
		@sucursal = Store.find(params[:id])
		@sucursal.destroy

		redirect_to sucursales_path
	end

	private
	def store_params
		params.require(:store).permit(:nombre, :calle, :colonia, :num_ext, :num_int, :cp, :ciudad, :pais, employees_attributes: [:id, :nombre, :rfc, :puesto])
	end
end
