require 'pry'
class UsersController < ApplicationController
  
  def index
    @users =  User.where(:user_type=>"Developer").or(User.where(:user_type=>"Qa"))
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end
end
