class UsersController < ApplicationController
	layout 'singin'
	def new
		if current_user
			redirect_to root_url
		else
			@user = User.new
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url
		else
			render "new"
		end
	end

	def UserByEmail	
		user = User.find_by_correo_electronico(params[:user_correo_electronico])
		if user
			render json: {"valid" => 'false'}
		else
			render json: {"valid" => 'true'}
		end
	end

	def UserByRFC	
		user = User.find_by_rfc(params[:user_rfc])
		if user
			render json: {"valid" => 'false'}
		else
			render json: {"valid" => 'true'}
		end
	end

	def UserByEmpresa	
		user = User.find_by_empresa(params[:user_empresa])
		if user
			render json: {"valid" => 'false'}
		else
			render json: {"valid" => 'true'}
		end
	end

	private
	def user_params
		params.require(:user).permit(:nombre, :correo_electronico, :rfc, :empresa, :contrasena, :contrasena_confirmation)
	end
end
