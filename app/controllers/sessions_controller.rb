# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Name is invalid'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to root_path
  end
end
