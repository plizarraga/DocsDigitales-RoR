class UsersController < ApplicationController
	layout 'singin'
	def new
		@user = User.new
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
