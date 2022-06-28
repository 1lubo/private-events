# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper
  before_action :require_login, except: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    flash[:success] = "User #{@user.name} successfully created!
    Thank you for signing up!"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @attended_events_future = @user.attended_events.future
    @attended_events_past = @user.attended_events.past
  end
end
