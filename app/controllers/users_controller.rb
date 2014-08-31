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
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end

	private
	def user_params
		params.require(:user).permit(:nombre, :correo_electronico, :rfc, :empresa, :contrasena, :contrasena_confirmation)
	end
end
