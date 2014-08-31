class SessionsController < ApplicationController
	layout 'singin' 

	def new
		if current_user
			redirect_to root_url
		else
			nil
		end
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_url
		else
			flash[:alert] = "Correo Electronico o Contrasena incorrectos."
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to log_in_path
	end
end
