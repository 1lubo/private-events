# frozen_string_literal: true

class RenameColumnsEventAttendings < ActiveRecord::Migration[7.0]
  def change
    rename_column :event_attendings, :user_id, :event_attendee_id
    rename_column :event_attendings, :event_id, :attended_event_id
  end
end
