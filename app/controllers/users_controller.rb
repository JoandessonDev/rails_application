class UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order(:name)
    @user = User.new
  end

  def new
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

  def edit
    @users = User.all
    render :index
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User updated successfully!"
    else
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    redirect_to users_path, notice: "User deleted successfully!", status: :see_other
  end


  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :cpf, :role, :salary)
  end

end
