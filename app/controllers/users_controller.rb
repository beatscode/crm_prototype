class UsersController < ApplicationController
  def index
  end

  def update
  	@user = User.find(params[:user][:id])
	@user.login = params[:user][:login]
	@user.save

	redirect = '/users/' + params[:user][:id] 
	 respond_to do |format|
       format.html { redirect_to(redirect) }
	end

  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end
end
