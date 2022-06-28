# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_login, only: %i[show]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = 'New event created successfully.'
      @event.attendees << current_user
      redirect_to @event
    else
      flash[:danger] = @event.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path
    else
      flash[:danger] = @event.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Event deleted successfully.'
    redirect_to root_path, status: 303
  end

  def attend
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @event.attendees << @user
    flash[:success] = "Looks like you're now attending this event"
    redirect_to @event
  end

  def leave
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @event.attendees.delete(@user)
    flash[:notice] = 'You are no longer attending this event'
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :creator_id)
  end
end
