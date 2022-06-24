# frozen_string_literal: true

class EventAttendingsController < ApplicationController
  def attend
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @event.attendees << @user
  end

  def leave
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @event.attendees.delete(@user.id)
  end
end
