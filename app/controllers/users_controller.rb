class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	puts "\n" * 5
  	puts "XXX" * 10
  	puts params
    @user = User.new(user_params)
    if @user.save
    	puts "guarde usuario"
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end