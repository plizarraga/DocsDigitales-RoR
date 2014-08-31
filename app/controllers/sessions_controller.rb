class SessionsController < ApplicationController
	layout 'singin' 

	def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash[:alert] = "Correo Electronico or Contrasena incorrectos"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to log_in_path, :notice => "Logged out!"
	end
end
