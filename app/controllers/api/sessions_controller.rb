class Api::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ['OmegaLUL'], status: 401
    end
  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: [' ¯\_(ツ)_/¯'], status: 404
    end
  end
end
