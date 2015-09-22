class SessionsController < ApplicationController
  def new
  end

  def create
  	if User.confirm(params[:email], params[:password]) |user|
  		session[:user_id] = user.id
  		redirect_to "/users/#{user.id}"
  	else
  		redirect_to :new
  	end
  end

  def destroy
  end
end
