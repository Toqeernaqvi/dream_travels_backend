# app/controllers/users_controller.rb

class UsersController < ApplicationController
  include RackSessionsFix

  def index
    @users = User.all
    render json: @users # Or render HTML if you prefer
  end

  def show
    @user = User.find(params[:id])
    render json: @user # Or render HTML if you prefer
  end
end
