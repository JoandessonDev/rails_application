class UsersController < ApplicationController


  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
    redirect_to users_path, notice: "User created with success!"
    else
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new 
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :cpf, :role, :salary)
  end

end
