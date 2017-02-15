class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def  create
    user_params = params.require(:user).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation])
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      Player.create(user:@user, first_name: @user.first_name, last_name: @user.last_name)
      redirect_to root_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end
end
